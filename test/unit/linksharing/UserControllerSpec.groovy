package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
@Mock(User)
class UserControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test register"() {
        setup:
        Map map = [firstname: firstname, lastname: lastname, email: email, username: username, password: password, confirmPassword: confirmPassword]
        params.putAll(map)
        when:
        controller.register()
        then:
        response.text == result
        where:
        firstname | lastname | email                     | username        | password | confirmPassword | result
        "diwakar" | "bhatt"  | "diwkarbhatt68@gmail.com" | "diwakarhatt68" | "12344"  | "12344"         | "Success"
    }

    void "test index action"() {
        setup:
        session.user = user;
        when:
        controller.index()
        then:
        response.text == result
        where:
        user      | result
        "diwakar" | "diwakar's Dashboard"
        null      | "null's Dashboard"
    }
}
