package linksharing

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    def springSecurityService

    String username
    String password
    String email
    String firstname
    String lastname
    String imagePath
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    transient confirmPassword
    static transients = ['fullname', 'subscribedTopics']
    static hasMany = [topics: Topic, subscriptions: Subscription, readingItems: ReadingItem, resources: Resource, resource_ratings: ResourceRating]
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    String getFullName() {
        "${firstname} ${lastname}"
    }
    static constraints = {
        username(blank: false, nullable: false, unique: true)
        email(unique: true, email: true, nullable: false, blank: false)
        password(minSize: 5, nullable: false, blank: false)
        firstname(nullable: false, blank: false)
        lastname(nullable: false, blank: false)
        imagePath(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        topics(nullable: true)
        subscriptions(nullable: true)
        resources(nullable: true)
        resource_ratings(nullable: true)
        readingItems(nullable: true)
        confirmPassword(bindable: true, validator: { val, obj ->
            if (obj.id) {
                return true
            } else {
                return val == obj.password
            }
        })
    }
    static mapping = {
        sort id: 'desc'
        password type:'text'
    }

    List<Topic> getSubscribedTopics() {
        List<Topic> subsTopics = Subscription.createCriteria().list() {
            projections
                    {
                        property("topic")
                    }
            eq("user", this)
        }
    }

    List<Topic> getCreatedTopics() {
        List<Topic> createdTopics = Topic.findAllByCreatedBy(this, [max: 10])
        return createdTopics
    }

    boolean canDeleteResource(Resource resource) {
        if ((resource.createdBy.id == this.id) || this.admin) {
            return true
        } else {
            return false
        }
    }

    int getScore(Resource resource) {
        int score = ResourceRating.createCriteria().get {
            projections {
                property("score")
            }
            eq("user", this)
            eq("resource", resource)
        }
        return score
    }

    boolean isSubscribed(long topicId) {
        return (Subscription.findByUserAndTopic(this, Topic.read(topicId)))
    }

    @Override
    String toString() {
        "${fullName}"
    }

    User(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }
    def afterInsert()
    {
        User.withNewSession {
            if (this.admin) {
                UserRole.create(this,Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true,flush:true))
            } else {
                UserRole.create(this, Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true,flush:true))
            }
        }
    }
    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
        confirmPassword = password
    }
}
