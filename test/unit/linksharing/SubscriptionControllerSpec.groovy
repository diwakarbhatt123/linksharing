package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(SubscriptionController)
@Mock([Subscription, User, Topic])
@Unroll
class SubscriptionControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test delete"() {
        setup:
        User user = new User().save(validate: false)
        Topic topic = new Topic().save(validate: false)
        Subscription subscription = new Subscription(seriousness: Seriousness.SERIOUS, user: user, topic: topic)
        subscription.id = 123
        subscription.save()
        when:
        controller.delete(id)
        then:
        response.text == result
        where:
        id  | result
        123 | "Success"
        121 | "Subscription not found"
    }

    void "test save"() {
        setup:
        User user = new User().save(validate: false)
        session.user = user
        Topic topic = new Topic()
        topic.id = 12
        topic.save(validate: false)
        when:
        controller.save(id)
        then:
        response.text == result
        where:
        id | result
        12 | "Success"
        13 | "Cannot make subscription"
    }

    void "test update"() {
        setup:
        User user = new User().save(validate: false)
        Topic topic = new Topic().save(validate:false)
        Subscription subscription = new Subscription(user: user,topic:topic)
        subscription.id = 12
        subscription.save(validate: false)
        when:
        controller.update(id, seriousness)
        then:
        response.text == result
        where:
        id  | seriousness | result
        12  | "serious"   | "Success"
        123 | "serious"   | "No subscription found"

    }
}
