package linksharing

import org.apache.commons.logging.Log

class LoginFilters {

    def filters = {
        loginCheck(controller: "*", controllerExclude: "login", action:"*")
                {
                    before = {
                        if (session.user) {

                        } else {
                            flash.error = "Please Sign in........."
                            redirect(action: "index", controller: "login")
                            return false
                        }
                    }
                }
    }
}
