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
    static transients = ['fullname', 'confirmPassword']
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


    @Override
    String toString() {
        "${fullName}"
    }
}