package linksharing
import spock.util.mop.Use

class Subscription {

    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated
    Date lastUpdated
    static constraints = {
        user (unique: true)
    }
}
