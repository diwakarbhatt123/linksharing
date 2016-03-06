package linksharing

import com.intelligrape.linksharing.RatingInfoVO
import com.intelligrape.linksharing.ResourceSearchCO
import jline.internal.Log

class ResourceController {

    def index() {}

    def delete(long id) {
      Resource resource = Resource.read(id)
        println ">>>>>>>>>>>${resource}<<<<<<<<<<<<<<<"
        if(resource)
        {
            resource.delete()
            render("Success")
        }
        else {
            render("Resource not found")
        }
    }
    def search(ResourceSearchCO co)
    {
        if(co.q)
         {
             co.visibility = Visibility.PUBLIC
             List<Resource> resources = Resource.search(co).list();
             render(resources)
         }
        else
        render("Q is not set")
    }
    def show(long id)
    {
        Resource resource = Resource.get(id)
        render resource.ratingInfo;
        render("</br></br>")
        List trendingTopics = Topic.trendingTopic
        trendingTopics.each {
            render(it)
            render("</br></br>")
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
