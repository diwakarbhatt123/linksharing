package linksharing

class ResourceRating {
    int score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [resource:Resource,user:User]
    static constraints = {
        score(min: 1, max: 5, nullable: false)
        user(unique:'resource')
    }
}
