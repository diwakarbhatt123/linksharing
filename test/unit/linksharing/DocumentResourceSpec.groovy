package linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(DocumentResource)
class DocumentResourceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test Document Resource"() {
        setup:
        Resource resource = new DocumentResource(description: description, createdBy: user, topic: topic, filePath: filePath)
        expect:
        resource.validate() == result
        where:
        description   | user       | topic       | filePath     | result
        "Lorem Ipsum" | new User() | new Topic() | ""           | false
        ""            | new User() | new Topic() | "/home/ttnd" | false
        "Lorem Ipsum" | new User() | new Topic() | "/home/ttnd" | true
    }
    void "toString Test"(){
        setup:
        Resource resource = new DocumentResource(filePath:filePath,description:description)

        expect:
        resource.toString()== result

        where:
        filePath | description | result
        "/home/ttnd" | "Lorem ipsum" | "Description:Lorem ipsum,filepath:/home/ttnd"
        "/home/deadpool" | "Random" | "Description:Random,filepath:/home/deadpool"
    }
}
