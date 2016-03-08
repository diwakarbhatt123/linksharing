package linksharing

import jline.internal.Log

class ReadingItemController {

    def index() {
        render "Hello"
    }
    def changeIsRead(Long id,Boolean isRead) {
        int result = ReadingItem.executeUpdate("update ReadingItem read set read.isRead=${isRead} where read.id=${id}")
        if (result) {
            flash.message = "Updated Successfully"
        } else {
            flash.error = "Could not udpate"
        }
        redirect(controller:"user",action:"index")
    }
}
