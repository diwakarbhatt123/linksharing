package linksharing
class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static constraints = {
        name(nullable: false, blank: false, unique: true)
        visibility(nullable: false)
        createdBy(nullable: false)
    }
}
