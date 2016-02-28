package linksharing

import com.intelligrape.linksharing.RatingInfoVO
import com.intelligrape.linksharing.ResourceSearchCO
import jline.internal.Log

class ResourceController {

    def index() {}

    def delete(long id) {
      Resource resource = Resource.load(id)
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
}
