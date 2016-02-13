package linksharing

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
    void "Check Url"()
    {
        setup:
        LinkResource linkResource = new LinkResource(description: "blah blah",createdBy: new User(),topic: new Topic(),url:url)

        expect:
        linkResource.validate()

        where:
        url << ["http://www.google.com","abc"]
    }
}
