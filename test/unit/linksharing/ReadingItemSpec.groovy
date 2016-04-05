package linksharing

import grails.test.mixin.Mock
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
        readingItem.validate() == result

        where:
        resuorce               | user       | read | result
        new DocumentResource() | new User() | false | true
        null                   | new User() | false | false
        new LinkResource()     | null       | false | false
        new LinkResource()     | new User() | null  | false

    }
    void "resource user unique test"() {
        setup:
        User user = new User()
        Resource resource = new DocumentResource()
        ReadingItem readingItem = new ReadingItem(user: user, resource: resource,isRead:false)
        when:
        readingItem.save()
        then:
        ReadingItem.count() == 1
        when:
        ReadingItem newReadingItem = new ReadingItem(user: user, resource: resource,isRead:false)
        newReadingItem.validate()
        then:
        newReadingItem.errors.allErrors.size() == 1
    }
}