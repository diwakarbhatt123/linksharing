package linksharing

class User {

    String email
    String username
    String password
    String firstname
    String lastname
    String confirmPassword
    byte[] photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static transients = ['fullname', 'confirmPassword','subscribedTopics']
    static hasMany = [topics: Topic, subscriptions: Subscription, readingItems: ReadingItem, resources: Resource, resource_ratings: ResourceRating]

    String getFullName() {
        "${firstname} ${lastname}"
    }
    static constraints = {
        username(nullable: false, unique: true)
        email(unique: true, email: true, nullable: false, blank: false)
        password(size: 0..5, nullable: false, blank: false)
        firstname(nullable: false)
        lastname(nullable: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        topics(nullable: true)
        subscriptions(nullable: true)
        resources(nullable: true)
        resource_ratings(nullable: true)
        readingItems(nullable: true)
        confirmPassword (nullable:true, blank:true, bindable: true, validator: { val, obj ->
            if (val.equals(obj.password))
                return true
            else
                return 'Password Mismatch'
        })
    }
    static mapping = {
        sort id:'desc'
    }

    List<Topic> getSubscribedTopics()
    {
        List<Topic> subsTopics = Subscription.createCriteria().list(max:5){
            projections
                    {
                        property("topic")
                    }
                   eq("user",this)
        }
    }
    boolean canDeleteResource(Resource resource)
    {
        if((resource.createdBy.id==this.id)|| this.admin)
        {
            return true
        }
        else {
            return false
        }
    }
    int getScore(Resource resource)
    {
        int score = ResourceRating.createCriteria().get{
            projections {
                property("score")
            }
            eq("user",this)
            eq("resource",resource)
        }
        return score
    }

    boolean isSubscribed(long topicId)
    {
        return(Subscription.findByUserAndTopic(this,Topic.read(topicId)))
    }

    @Override
    String toString() {
        "${fullName}"
    }
}