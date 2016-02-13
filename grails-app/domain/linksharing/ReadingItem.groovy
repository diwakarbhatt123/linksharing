package linksharing

class ReadingItem {

    Resource resource
    User user
    boolean isRead
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,resource:Resource]
    static constraints = {
        user (unique: true,nullable: false)
        resource (nullable: false)
        isRead (nullable:false)
    }
}
