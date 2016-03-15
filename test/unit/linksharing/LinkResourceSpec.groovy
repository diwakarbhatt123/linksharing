package linksharing

import com.google.common.hash.HashCode
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@Mock(LinkResource)
class LinkResourceSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    @Unroll
    void "Check Url"() {
        setup:
        LinkResource linkResource = new LinkResource(description: "blah blah", createdBy: new User(), topic: new Topic(), url: url)

        expect:
        linkResource.validate() == result

        where:
        url                     | result
        "http://www.google.com" | true
        "abc"                   | false
    }
    void "toString test"(){
        setup:
        Resource resource = new LinkResource(url:url,description:description)

        expect:
        resource.toString()== result

        where:
        url | description | result
        "http://www.google.com" | "Lorem ipsum" | "Description:Lorem ipsum,Url:http://www.google.com"
        "http://www.yahoo.com" | "Random" | "Description:Random,Url:http://www.yahoo.com"
    }
}
