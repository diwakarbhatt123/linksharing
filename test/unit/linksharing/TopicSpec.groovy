package linksharing

import com.intelligrape.linksharing.Seriousness
import com.intelligrape.linksharing.Visibility
import grails.test.mixin.Mock
import spock.lang.IgnoreRest
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Mock(Topic)
class TopicSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "test TopicName"() {
        setup:
        Topic topic = new Topic(name: name, visibility: visibility, createdBy: creater)
        User user = new User(name: "abc")
        when:
        Boolean result = topic.validate()

        then:
        result == valid

        where:
        name     | visibility        | creater    | valid
        "Grails" | null              | new User() | false
        "Grails" | Visibility.PUBLIC | user       | true
        "Grails" | Visibility.PUBLIC | user       | false
    }

    void "unique name"() {
        setup:
        String topicName = "Grails"
        Topic topic = new Topic(name: topicName, createdBy: new User(), visibility: Visibility.PUBLIC)

        when:
        topic.save()

        then:
        topic.count() == 1

        when:
        Topic newTopic = new Topic(name: topicName, createdBy: new User(), visibility: Visibility.PUBLIC)
        newTopic.save()

        then:
        newTopic.errors.allErrors.size() == 1
    }

    def "toString Test"() {
        setup:
        Topic topic = new User(name: name)

        expect:
        topic.toString() == result

        where:
        name     | result
        "Grails" | "Grails"
        "AMC"    | "AMC"
    }

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GORM-1 Test>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    @Unroll
    void "Test Topic Validation"() {

        setup:

        Topic topic = new Topic(name: name, visibility: visibility);
        when:
        Boolean result = topic.validate();
        String topicname = name

        then:
        result == valid
        checkname == topicname.equals(validname)
        where:
        name     | visibility         | valid | validname | checkname
        "grails" | Visibility.PRIVATE | true  | "amc"     | false
        "java"   | Visibility.PUBLIC  | true  | "java"    | true

    }

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Domain-1 Test>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    @Unroll
    @IgnoreRest
    void "Seriousness Test"() {
        expect:
        Seriousness.getSeriousness(input) == result
        where:
        input          | result
        "serious"      | Seriousness.SERIOUS
        "very serious" | Seriousness.VERYSERIOUS
        "casual"       | Seriousness.CASUAL
    }
}
