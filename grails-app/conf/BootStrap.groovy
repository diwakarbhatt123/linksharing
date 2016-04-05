import com.intelligrape.linksharing.Seriousness
import com.intelligrape.linksharing.Visibility
import jline.internal.Log
import linksharing.*

class BootStrap {
    def grailsApplication
    def init = {

        println grailsApplication.config.myname
        createUser()
        createTopics()
        createResources()
        subscribeTopic()
        createReadingItems()
        createResourceRating()
    }

    void createUser() {
        if (User.count() == 0) {
            User user = new User(firstname: "Diwakar", lastname: "Bhatt", email: "diwakarbhatt68@gmail.com", username: "diwakarbhatt68", password: Passwords.defPassword,confirmPassword:Passwords.defPassword, admin: true, active: true, imagePath: "");
            User admin = new User(firstname: "User2", lastname: "User2", email: "user2@gmail.com", username: "User2", password: Passwords.defPassword,confirmPassword:Passwords.defPassword, active: false);
            if(user.validate()) {
                user.save(flush:true,failOnError:true)
            }
            if(user.validate()) {
                admin.save(flush: true, failOnError: true)
            }
        } else {
            Log.info("Users already Exists")
        }
    }

    void createTopics() {
        List topicsList = ["Grails", "DevOps", "AMC", "Java", "MeanStack", "Automata", "Ruby", "Groovy", "C++", ".NET"]
        Integer indexTopic = 0;
        User.list().each { user ->
            if (!(user?.topics)) {
                (0..4).each {
                    Topic newTopic = new Topic(name: topicsList[indexTopic], createdBy: user, visibility: Visibility.PUBLIC).save(validate: false, failOnError: false)
                    indexTopic++
                }
            } else {
                Log.info("User already has 5 topics")
            }
        }
    }

    void createResources() {
        List topicList = Topic.getAll();
        if (Resource.count() == 0) {
            topicList.each {
                Resource docResource1 = new DocumentResource(description: it.name, topic: it, createdBy: it.createdBy, filePath: "ftp://ftp.funet.fi/pub/standards/RFC/rfc959.txt").save(flush: true, failOnError: true)
                Resource docResource2 = new DocumentResource(description: it.name, topic: it, createdBy: it.createdBy, filePath: "ftp://ftp.funet.fi/pub/standards/RFC/rfc960.txt").save(flush: true, failOnError: true)
                Resource linkResource1 = new LinkResource(description: it.name, topic: it, createdBy: it.createdBy, url: "https://en.wikipedia.org/wiki/Main_Page").save(flush: true, failOnError: true)
                Resource linkResource2 = new LinkResource(description: it.name, topic: it, createdBy: it.createdBy, url: "http://www.encyclopedia.com/").save(flush: true, failOnError: true)
            }
        } else {
            Log.info("Resource count greater than zero")
        }
        Log.info("Resource count is" + Resource.count())

    }

    void subscribeTopic() {
        User.list().each { user ->
            Topic.list().each { topic ->
                if (Subscription.countByUserAndTopic(user, topic) == 0 && user.id != topic.createdBy.id) {
                    Subscription subscription = new Subscription(seriousness: Seriousness.VERYSERIOUS, user: user, topic: topic).save(flush: true, failOnError: true)
                } else {
                    Log.info("${user.fullName} is already subscribed to ${topic.name}")
                }
            }
        }
    }

    void createReadingItems() {
        User user = User.findByFirstname("Diwakar")
        List resourceNotCreated = Resource.findAllByCreatedByNotEqual(user)
        resourceNotCreated.each {
            if (Subscription.countByUserAndTopic(user, it.topic) > 0) {
                if (ReadingItem.countByUserAndResource(user, it) == 0)
                    ReadingItem readingItem = new ReadingItem(isRead: false, resource: it, user: user).save(flush: true, failOnError: true)
                else
                    Log.info("${user.fullName} already has this Reading Item in his list")
            } else {
                Log.info("User is not subscribed to this topic")
            }
        }
    }

    void createResourceRating() {
        User user = User.findByFirstname("User2")
        List unRead = ReadingItem.findAllByUserAndIsRead(user, false)
        if (unRead.size() > 0) {
            unRead.each {
                ResourceRating rating = new ResourceRating(score: 5, user: user, resource: it.resource).save(flush: true, failOnError: true)
            }
        } else {
            Log.info("All the reading item has been read")
        }

    }
    def destroy = {
    }
}
