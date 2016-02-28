package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ResourceController)
@Mock([Resource,LinkResource,Topic])
class ResourceControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test delete"() {
        setup:
        LinkResource resource = new LinkResource(id:id).save(validate:false)
        when:
        controller.delete(id)
        then:
        response.text == "Success"
        where:
        id<<[10]

    }
}
