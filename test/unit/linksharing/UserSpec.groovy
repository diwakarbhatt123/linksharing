package linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
@Mock(User)
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
        println user.errors.allErrors
        where:
        fname     | lname   | email                      | password    | valid
        ""        | "bhatt" | "d@b.com"                  | "123"       | false
        "Diwakar" | "Bhatt" | "diwakarbhatt68@gmail.com" | "123456"    | false
        "Diwakar" | "Bhatt" | "diwakar"                  | "tested123" | false
    }

    def "Unique Email"() {
        setup:
        String email = "diwakar.bhatt@tothenew.com"
        String password = 'password'
        User user = new User(firstName: "Diwakar", lastName: "Bhatt", email: email, password: password)

        when:
        user.save()

        then:
        user.count() == 1

        when:
        User newEmployee = new User(firstName: "Ajay", lastName: "Kumar", email: email, password: password)
        newEmployee.save()

        then:
        User.count() == 1
        newEmployee.errors.allErrors.size() == 1
        newEmployee.errors.getFieldErrorCount('email') == 1
    }

    def "Unique Username"() {
        setup:
        String username = "diwakarbhatt68"
        User user = new User(username: username)

        when:
        user.save(validate: false)

        then:
        user.count() == 1

        when:
        User newEmployee = new User(username: username)
        newEmployee.save()

        then:
        User.count() == 1
        newEmployee.errors.allErrors.size() == 1
        newEmployee.errors.getFieldErrorCount('username') == 1

    }

    def "Get Fullname"() {

        setup:
        User user = new User(firstname: fname, lastname: lname)

        expect:
        user.fullName == full

        where:
        fname     | lname   | full
        "Diwakar" | "Bhatt" | "Diwakar Bhatt"
        "a"       | "b"     | "a b"
    }

    def "To String test"() {
        setup:
        User user = new User(firstname: fname, lastname: lname)

        expect:
        user.toString() == full

        where:
        fname     | lname   | full
        "Diwakar" | "Bhatt" | "Diwakar Bhatt"
        "a"       | "b"     | "a b"
    }

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<GORM-1 Test Cases>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    @Unroll
    void "Test User Validation"() {

        setup:
        User user = new User(username: uname, firstname: fname, lastname: lname, email: mail, password: pwd, admin: admn, active: active)
        when:
        Boolean result = user.validate()
        String username = user.toString()
        then:
        result == valid
        username.equals(validname)
        where:
        uname            | fname     | lname   | mail                       | pwd     | admn | active | valid | validname
        "diwakarbhatt68" | "diwakar" | "bhatt" | "diwakarbhatt68@gmail.com" | "12345" | true | true   | true  | "diwakar bhatt"
        "abc"            | "temp"    | "user"  | "tempuser@gmail.com"       | "12345" | true | true   | true  | "temp user"

    }
}
