package linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */

class UserSpec extends Specification {

    void "test"() {
        expect:
        true
    }

    void "user validation"() {
        setup:
        User user = new User(firstName: fname, lastName: lname, email: email, password: password)
        when:
        Boolean result = user.validate()

        then:
        result == valid
        where:
        fname     | lname   | email                      | password    | valid
        ""        | "bhatt" | "d@b.com"                  | "123"       | false
        "Diwakar" | "Bhatt" | "diwakarbhatt68@gmail.com" | "123456"    | false
        "Diwakar" | "Bhatt" | "diwakar"                  | "tested123" | true

    }

    def "Unique Email"() {
        setup:
        String email = "diwakar.bhatt@tothenew.com"
        String password = 'password'
        User user = new User(firstName: "Puneet", lastName: "Kaur", email: email, password: password)

        when:
        user.save()

        then:
        user.count() == 1

        when:
        User newEmployee = new User(firstName: "Neha", lastName: "Gupta", email: email, password: password)
        newEmployee.save()

        then:
        User.count() == 1
        newEmployee.errors.allErrors.size() == 1
        newEmployee.errors.getFieldErrorCount('email') == 1
    }

    def "Get Fullname"() {

        setup:
        User user = new User(firstname: fname, lastname: lname)

        expect:
        user.fullName = full

        where:
        fname     | lname   | full
        "Diwakar" | "Bhatt" | "Diwakar Bhatt"
        "a"       | "b"     | "a"
    }
}
