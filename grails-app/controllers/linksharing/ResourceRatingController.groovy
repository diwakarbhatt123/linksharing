package linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class ResourceRatingController {

    def index() {}
    @Secured(['IS_AUTHENTICATED_FULLY'])
    def saveRating(long id,int rating)
    { def message = ["message":"Success"];
          User user = session.user
          Resource resource = Resource.read(id)
        ResourceRating resourceRating = ResourceRating.findByUserAndResource(user,resource)
        if(resourceRating)
        {
            resourceRating.score = rating
            resourceRating.save()
        }
        else {
            ResourceRating newResourceRating = new ResourceRating(score:params.rating,user:user,resource:resource)
            if(newResourceRating.validate()){
                newResourceRating.save()
            }
            else {
                message = ["message":"Cannot save Resource Rating"]
            }
        }
        render message as JSON
    }
}
