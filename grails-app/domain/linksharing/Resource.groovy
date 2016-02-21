package linksharing

abstract class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    static hasMany = [ratings:ResourceRating,readingItems:ReadingItem]
    static belongsTo = [createdBy:User,topic:Topic]
    static constraints = {
            description(nullable: false,blank: false)
            dateCreated(nullable:true)
            lastUpdated(nullable:true)
            createdBy(nullable:true)
            topic(nullable:true)
            ratings(nullable:true)
            readingItems(nullable:true)
        }
    }

