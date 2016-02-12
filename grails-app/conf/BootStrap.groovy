class BootStrap {

    def init = { servletContext ->

        println("Bootstrap started...")
        def prop = grailsApplication.config.myname
        log.info"external file content="+prop
    }
    def destroy = {
    }
}
