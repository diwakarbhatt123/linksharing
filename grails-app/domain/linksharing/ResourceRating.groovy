package linksharing

class ResourceRating {
    int score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [resource:Resource,user:User]
    static constraints = {
        resource(nullable: false)
        score(min: 0, max: 5, nullable: false)
        user(nullable: false)
    }
}
