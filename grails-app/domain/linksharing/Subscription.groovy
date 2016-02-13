package linksharing
import spock.util.mop.Use

class Subscription {

    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
        user (unique: true)
    }
}
