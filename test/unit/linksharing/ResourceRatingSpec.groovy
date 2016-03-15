package linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ResourceRating)
class ResourceRatingSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "resource rating validation"() {
        setup:
        ResourceRating resourceRating = new ResourceRating(resource: resource, user: user, score: score)

        expect:
        resourceRating.validate() == result

        where:
        resource               | user       | score | result
        null                   | new User() | 3     | false
        null                   | null       | 2     | false
        new DocumentResource() | new User() | 7     | false
        new DocumentResource() | new User() | 2     | true
    }

    void "resource user unique test"() {
        setup:
        User user = new User()
        Resource resource = new DocumentResource()
        ResourceRating resourceRating = new ResourceRating(user: user, resource: resource, score: 5)
        when:
        resourceRating.save()
        then:
        ResourceRating.count() == 1
        when:
        ResourceRating newresourceRating = new ResourceRating(user: user, resource: resource, score: 5)
        newresourceRating.validate()
        then:
        newresourceRating.errors.allErrors.size() == 1
    }
}
