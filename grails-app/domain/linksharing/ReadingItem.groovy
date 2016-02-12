package linksharing

class ReadingItem {

    Resource resource
    User user
    boolean isRead
    Date dateCreated
    Date lastUpdated
    static constraints = {
        user (unique: true)
    }
}
