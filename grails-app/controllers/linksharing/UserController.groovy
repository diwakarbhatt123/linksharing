package linksharing

import jline.internal.Log


class UserController {

    def index() {
        render("${session.user}'s Dashboard")
    }

    def register() {
        User registerUser = new User(firstname: params.firstname, lastname: params.lastname, email: params.email, username: params.username, password: params.password,confirmPassword: params.confirmPassword)
        Log.info(registerUser.confirmPassword)
        if (registerUser.validate()) {
            render("Success")
        } else {
            def errMsgList = registerUser.errors.allErrors.collect{g.message([error:it])}
            render(errMsgList)
        }
    }
}
