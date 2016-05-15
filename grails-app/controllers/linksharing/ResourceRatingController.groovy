package linksharing

import grails.converters.JSON

class ResourceRatingController {

    def index() {}
    def saveRating(long id,float rating)
    {
        println id+"/"+rating
        def message = ["message":"Success"];
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
