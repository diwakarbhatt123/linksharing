package linksharing

import jdk.management.resource.ResourceType

class ResourceRating {
    Resource resource
    User user
    int score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [resource:Resource]
    static constraints = {
        resource(nullable: false)
        score(min: 0, max: 5, nullable: false)
        user(unique: true,nullable: false)
    }
}
