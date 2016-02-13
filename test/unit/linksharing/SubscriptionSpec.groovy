package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Mock(Subscription)
class SubscriptionSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "test something"() {

        setup:
        User user = new User()
        Subscription subscription = new Subscription(topic: new Topic(),user: user,seriousness: Seriousness.CASUAL)

        when:
        subscription.save()

        then:
        subscription.count()==1

        when:
        Subscription newsubscription = new Subscription(topic: new Topic(),user: user,seriousness: Seriousness.CASUAL)
        newsubscription.save()

        then:
        newsubscription.errors.allErrors.size()==1


    }
}
