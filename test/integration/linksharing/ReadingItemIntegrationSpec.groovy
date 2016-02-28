package linksharing

import grails.test.spock.IntegrationSpec
import jline.internal.Log

class ReadingItemIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "test ChangeisRead"() {
        setup:
       ReadingItemController readingItemController = new ReadingItemController();
        when:
        readingItemController.changeIsRead(id,isRead)
        ReadingItem readingItem = ReadingItem.get(id)
        Log.info(readingItem)
        then:
        readingItem.isRead == isRead
        where:
        id | isRead
        1  |  false
    }
}
