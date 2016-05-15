package linksharing

class ResourceRating {
    float score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [resource:Resource,user:User]
    static constraints = {
        score(min: 0F, max: 5F, nullable: false)
        user(unique:'resource')
    }
}
