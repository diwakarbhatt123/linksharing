package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ResourceController)
@Mock([Resource,DocumentResource,Topic])
class ResourceControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test delete"() {
        setup:
        Resource resource = new DocumentResource(description: "Grails",filePath: "ftp://ftp.funet.fi/pub/standards/RFC/rfc959.txt")
        resource.id = 10
        resource.save()
        when:
        controller.delete(10)
        then:
        response.text == "Success"
        where:
        id<<[10]

    }
}
