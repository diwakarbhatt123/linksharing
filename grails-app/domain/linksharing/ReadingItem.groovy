package linksharing

class ReadingItem {

    boolean isRead
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,resource:Resource]
    static constraints = {
        isRead(nullable:false)
        resource(nullable: false)
        user(nullable: false,unique:'resource')
    }

    @Override
    String toString() {
        "${user}&${resource}"
    }
}
