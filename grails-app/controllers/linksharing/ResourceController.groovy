package linksharing

import com.intelligrape.linksharing.RatingInfoVO
import com.intelligrape.linksharing.ResourceSearchCO
import jline.internal.Log

class ResourceController {

    def index() {}

    def delete(long id) {

        User loggediInUser = session.user
        Resource resource = Resource.read(id)
        if(loggediInUser.canDeleteResource(resource))
        {
            resource.delete()
            flash.message = "Resource Deleted"
        }
        else {
            flash.error = "Cannot found resource"
        }
        redirect(controller:"login",action:"index")
    }
    def search(ResourceSearchCO co)
    {
        if(co.q)
         {
             co.visibility = Visibility.PUBLIC
             List<Resource> resources = Resource.search(co).list([max:5]);
             render(view:"search",model:[searchResources:resources])
         }
        else
        flash.message = "No input in query"
    }
    def show(long id)
    {
        Resource resource = Resource.get(id)
        if(resource.canViewedBy(session.user)) {
            List trendingTopics = Topic.trendingTopic
            render(view: "show", model: [resource: resource, trendingTopics: trendingTopics])
        }
        else {
            flash.error = "User Cannot view Topic"
        }
    }
    def saveLinkResource(String url,String description,String topic)
    {
        User createdBy = session.user
        Resource resource = new LinkResource(url:url,description:description,topic:Topic.findByName(topic),createdBy:createdBy)
        if(resource.validate())
        {
            flash.message = "Success"
            resource.save()
        }
        else {
            flash.error = "Resource could not be saved"
        }
        redirect(controller: "user",action: "index")
    }
//    def saveDocumentResource(String url,String description,String topic)
//    {
//        User createdBy = session.user
//        Resource resource = new DocumentResource(filePath: url,description:description,topic:Topic.findByName(topic),createdBy:createdBy)
//        if(resource.validate())
//        {
//            flash.message = "Success"
//            resource.save()
//        }
//        else {
//            flash.error = "Resource could not be saved"
//        }
//        redirect(controller: "user",action: "index")
//    }
}
