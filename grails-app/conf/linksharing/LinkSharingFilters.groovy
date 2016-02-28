package linksharing

import jline.internal.Log

class LinkSharingFilters {

    def filters = {
        logAllURI(controller: "*", action: "*")
                {
                    before = {
                        Log.info("These are params"+params)
                    }
                }

    }
}
