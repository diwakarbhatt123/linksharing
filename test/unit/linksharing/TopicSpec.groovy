package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Mock(Topic)
class TopicSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "test something"() {
        setup:
        Topic topic = new Topic(name: name, visibility: visibility, createdBy: creater)

        when:
        Boolean result = topic.validate()

        then:
        result == valid

        where:
        name     | visibility        | creater    | valid
        "Grails" | null              | new User() | true
        ""       | Visibility.PUBLIC | new User() | false
        null     | Visibility.PUBLIC | new User() | true

    }

    void "unique name"() {
        setup:
        String topicName = "Grails"
        Topic topic = new Topic(name: topicName,createdBy: new User(),visibility: Visibility.PUBLIC)

        when:
        topic.save()

        then:
        topic.count() == 1

        when:
        Topic newTopic = new Topic(name: topicName,createdBy: new User(),visibility: Visibility.PUBLIC)
        newTopic.save()

        then:
        newTopic.errors.allErrors.size() == 1
    }
}
