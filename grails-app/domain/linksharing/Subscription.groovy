package linksharing

import com.intelligrape.linksharing.Seriousness

class Subscription {

    Seriousness seriousness = Seriousness.SERIOUS;
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
        seriousness(nullable: false,blank:false)
        topic(nullable: false)
        user(unique:'topic')
    }
    static mapping = {
        user lazy:false
        topic lazy: false
    }

}
