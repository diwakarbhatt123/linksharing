package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

@TestFor(LoginController)
@Mock([User, ResourceRating])
class LoginControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test index"() {
        setup:
        session.user = sessionuser
        when:
        controller.index()
        then:
        response.forwardedUrl == url
        response.text == text
        where:
        sessionuser | url           | text
        "User1"     | "/user/index" | ""
        null        | ""            | "User not logged in"
    }

    void "login Handler test"() {
        setup:
        User user = new User(username: username, password: password)
        user.active = active
        user.save(validate: false)
        when:
        controller.loginHandler(username, password)
        then:
        response.redirectedUrl == url
        response.text == text
        where:
        username        | password | active | url  | text
        "diwkarbhatt68" | 64353    | true   | "/"  | null
        "diwkarbhatt68" | 64353    | false  | null | "Your Account is not active"
    }

    void "test invalidate"() {
        setup:
        session.user = "User1"
        when:
        controller.logout()
        then:
        session.user == null
    }
}
