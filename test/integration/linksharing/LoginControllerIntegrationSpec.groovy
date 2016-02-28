package linksharing

import grails.test.spock.IntegrationSpec

class LoginControllerIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "top Posts"() {
        setup:
        LoginController loginController = new LoginController()
        when:
        List list = loginController.topPosts()
        then:
        !list.isEmpty()
    }
}
