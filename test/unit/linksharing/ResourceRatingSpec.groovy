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
        resourceRating.validate() == true

        where:
        resource               | user       | score
        null                   | new User() | 3
        null                   | null       | 2
        new DocumentResource() | new User() | 7
        new DocumentResource() | new User() | 2
    }
}
