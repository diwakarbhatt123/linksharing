package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.util.mop.Use

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(LoginController)
@Mock(User)
class LoginControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test index"() {
        setup:
        session.user = user
        when:
        controller.index()
        then:
        response.forwardedUrl == "/user/index"
        where:
        user << ["user1"]
    }
    void "login Handler test"()
    {
        setup:
         User user = new User(username:username,password:password)
         user.active = true
         user.save(validate:false)
        when:
        controller.loginHandler(username,password)
        then:
        response.redirectedUrl == "/"
        where:
        username        | password
        "diwkarbhatt68" | 64353
    }
    void "test invalidate"()
    {
        setup:
        session.user = "User1"
        when:
        controller.logout()
        then:
        session.user == null
    }
}
