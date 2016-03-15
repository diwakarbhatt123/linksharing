package linksharing

import com.intelligrape.linksharing.Visibility
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(TopicController)
@Mock([Topic, User, Subscription])
class TopicControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "topic show"() {
        setup:
        Topic topic = new Topic(id: id, visibility: visbility).save(validate: false)
        when:
        controller.show(id)
        then:
        response.text == "Success"
        where:
        id | visbility
        1  | Visibility.PUBLIC
    }

    void "topic save"() {
        setup:
        User user = new User().save(validate:false)
        Topic topic = new Topic(name: topicname, visibility: Visibility.toEnum(visibility)).save(validate: true)
        when:
        controller.save(topicname, visibility)
        then:
        response.text == "Success"
        where:
        topicname    | visibility
        "temptopic1" | "public"
    }
}
