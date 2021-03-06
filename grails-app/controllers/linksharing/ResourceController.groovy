package linksharing

import com.intelligrape.linksharing.ResourceSearchCO
import com.intelligrape.linksharing.Visibility

class ResourceController {

    def index() {}

    def delete(long id) {

        User loggediInUser = session.user
        Resource resource = Resource.read(id)
        if (loggediInUser.canDeleteResource(resource)) {
            if (!resource.isLinkResource()) {

            }
            resource.delete()
            flash.message = "Resource Deleted"
        } else {
            flash.error = "Cannot found resource"
        }
        redirect(controller: "login", action: "index")
    }
    def search(ResourceSearchCO co) {
        if (co.q) {
            List<Resource> resources = Resource.search(co).list();


            List<Topic> topics = Topic.search(co).list();

            println topics;
            render(view: "search", model: [searchResources: resources,searchTopics:topics,query:co.q])
        } else
            flash.message = "No input in query"
    }
    def update(long id,String description){
        Resource resource = Resource.read(id)
        if(resource){
            resource.description = description
            flash.message = (resource.validate())?resource.save():"Could not save"
        }
        else {
            flash.error = "Could not find resource"
        }
        redirect(url:request.getHeader('referer'))
    }

    def show(long id) {
        Resource resource = Resource.get(id)
        List trendingTopics = Topic.trendingTopic
        ResourceRating resourceRating = ResourceRating.findByResourceAndUser(resource,session.user);
        Float score = (resourceRating==null)?0:resourceRating.score;
        if (resource.topic.isPublic()) {
            render(view: "show", model: [resource: resource, trendingTopics: trendingTopics,rating:score])
        } else {
            if (resource.canViewedBy(session.user)) {

                render(view: "show", model: [resource: resource, trendingTopics: trendingTopics,rating:score])
            } else {
                flash.error = "User Cannot view Topic"
            }
        }
    }

    protected static addToReadingItems(Resource resource) {
        Topic resourceTopic = resource.topic
        List<User> subscribedUser = resourceTopic.subscribedUsers
        subscribedUser.each { user ->
            ReadingItem userReadingItem = new ReadingItem(user: user, resource: resource, isRead: (user.id == resource.createdBy.id))
            if (userReadingItem.validate()) {
                userReadingItem.save()
            }
        }
    }
}
