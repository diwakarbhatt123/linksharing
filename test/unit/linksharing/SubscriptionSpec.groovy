package linksharing

import com.intelligrape.linksharing.Seriousness
import grails.test.mixin.Mock
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Mock([Subscription,User,Topic])
class SubscriptionSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "test something"() {

        setup:
        User user = new User().save(validate:false)
        Topic topic = new Topic().save(validate:false)
        Subscription subscription = new Subscription(topic: topic,user: user,seriousness: Seriousness.CASUAL)

        when:
        subscription.save(validate:false)

        then:
        subscription.count()==1

        when:
        Subscription newsubscription = new Subscription(topic: topic,user: user,seriousness: Seriousness.CASUAL)
        newsubscription.save()

        then:
        newsubscription.errors.allErrors.size()==1
        println newsubscription.errors.allErrors
    }
}
