package linksharing

import com.intelligrape.linksharing.RatingInfoVO
import grails.test.spock.IntegrationSpec

class ResourceIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "getRatingInfo Test"() {
        setup:
        Resource resource =Resource.get(id)
        when:
        RatingInfoVO ratingInfoVO = resource.ratingInfo;
        then:
        ratingInfoVO != null
        where:
        id <<[1]
    }
}
