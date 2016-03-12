package linksharing

import com.intelligrape.linksharing.RatingInfoVO
import com.intelligrape.linksharing.ResourceSearchCO
import jline.internal.Log

abstract class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    static transients = ['ratingInfo']
    static hasMany = [ratings: ResourceRating, readingItems: ReadingItem]
    static belongsTo = [createdBy: User, topic: Topic]
    static mapping = {
        tablePerHierarchy(true)
    }

    RatingInfoVO getRatingInfo() {
        List result = Resource.createCriteria().list {
            'ratings'
                    {
                        projections
                                {
                                    count('id')
                                    sum('score')
                                    avg('score')
                                }
                    }
            eq('id',id)
        }
        Log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${result}<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
        return new RatingInfoVO(totalVotes:result[0][0],totalScore:result[0][1],averageScore:result[0][2])
    }
    static constraints = {
        description(nullable: false, blank: false)
        dateCreated(nullable: true)
        lastUpdated(nullable: true)
        createdBy(nullable: true)
        topic(nullable: true)
        ratings(nullable: true)
        readingItems(nullable: true)
    }
    static namedQueries = {
        search { ResourceSearchCO co ->
            if(co.q)
            {
              or{
                  ilike("description","%${co.q}%")
                  'topic' {
                      ilike("name", "%${co.q}%")
                  }
              }
            }
        }
    }
    static topPosts()
    {
        List resources=ResourceRating.createCriteria().list(max:5){
            projections{
                groupProperty('resource')
                avg('score','avgScore')
            }
            'resource'{
                property('id')
            }
            order('avgScore','desc')
        }
        return resources
    }
    boolean isLinkResource()
    {
        if(this instanceof LinkResource) {
            return true
        }
            else if(this instanceof DocumentResource)
        {
         return false
        }
    }
    boolean canViewedBy(User user)
    {
        Topic resourceTopic = this.topic
        return resourceTopic.canViewedBy(user)
    }
}

