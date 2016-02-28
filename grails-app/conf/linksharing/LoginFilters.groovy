package linksharing

class LoginFilters {

    def filters = {
        loginCheck(controller: "*", controllerExclude: "login")
                {
                    before = {
                        if (session.user) {
                            if (controllerName != 'console')
                                render session.user
                        } else {
                            flash.error = "Please Sign in........."
                            redirect(action: "index", controller: "login")
                            return false
                        }
                    }
                }
    }
}
