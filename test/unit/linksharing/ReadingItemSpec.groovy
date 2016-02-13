package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Mock(ReadingItem)
class ReadingItemSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "validate ReadingItem"() {
        setup:
        ReadingItem readingItem = new ReadingItem(resource: resuorce, user: user, isRead: read)

        expect:
        readingItem.validate() == true

        where:
        resuorce               | user       | read
        new DocumentResource() | new User() | false
        null                   | new User() | false
        new LinkResource()     | null       | false
        new LinkResource()     | new User() | null

    }
}
