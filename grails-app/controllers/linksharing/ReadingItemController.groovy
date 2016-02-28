package linksharing

import jline.internal.Log

class ReadingItemController {

    def index() {
        render "Hello"
    }
    def changeIsRead(Long id,Boolean isRead) {
        Log.info("Change is read called")
        int result = ReadingItem.executeUpdate("update ReadingItem set isRead=${isRead} where id=${id}")
        if (result) {
            render "Success"
        } else {
            render "Could not Update"
        }
    }
}
