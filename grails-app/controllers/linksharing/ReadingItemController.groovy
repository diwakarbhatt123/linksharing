package linksharing

import grails.converters.JSON
import jline.internal.Log

class ReadingItemController {

    def index() {
        render "Hello"
    }
    def addToReadingItem(int id)
    {
       ReadingItem readingItem = new ReadingItem(user:session.user,resource:Resource.read(id),isRead:false)
        if(readingItem.validate())
        {
            readingItem.save()
            flash.message = "Resource added in reading item successfully"
        }
        else {
            flash.error = "Could not add to reading item"
        }
        redirect(url:request.getHeader('referer'))
    }
    def changeIsRead(Long id,Boolean isRead) {
        int result = ReadingItem.executeUpdate("update ReadingItem read set read.isRead=${isRead} where read.id=${id}")
        if (result) {
            [message:"Status Updated Successfully"] as JSON
        } else {
               [error:"Error while Updating Status"] as JSON
        }
        redirect(url:request.getHeader('referer'))
    }
}
