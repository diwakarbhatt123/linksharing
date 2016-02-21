package linksharing
import spock.util.mop.Use

class Subscription {

    Seriousness seriousness
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
        seriousness(nullable: false,blank:false)
        topic(nullable: true)
    }
}
