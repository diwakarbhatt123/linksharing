package linksharing

class Subscription {

    Seriousness seriousness
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
        seriousness(nullable: false,blank:false)
        topic(nullable: true)
    }
    static mapping = {
        seriousness enumType:Seriousness.SERIOUS
        user lazy:false
        topic lazy: false
    }

}
