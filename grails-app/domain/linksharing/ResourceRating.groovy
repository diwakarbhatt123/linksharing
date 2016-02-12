package linksharing

class ResourceRating {
    Resource resource
    User user
    int score
    Date dateCreated
    Date lastUpdated
    static constraints = {
        score(min: 0, max: 5)
        user(unique: true)
    }
}
