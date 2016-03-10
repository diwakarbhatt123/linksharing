package linksharing

import org.apache.commons.logging.Log

class LoginFilters {

    def filters = {
        loginCheck(controller: "*", action:"save|delete|invite|join|update|saveRating|changeIsRead")
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
        userIndexCheck(controller:"user",action:"index"){
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
