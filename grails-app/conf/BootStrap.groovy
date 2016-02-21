import jline.internal.Log
import linksharing.DocumentResource
import linksharing.LinkResource
import linksharing.ReadingItem
import linksharing.Resource
import linksharing.ResourceRating
import linksharing.Seriousness
import linksharing.Subscription
import linksharing.Topic
import linksharing.User
import linksharing.Visibility

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
        User user = new User(firstname: "User1", lastname: "User1", email: "user1@gmail.com", username: "User1", password: Passwords.defPassword, admin: false);
        User admin = new User(firstname: "User2", lastname: "User2", email: "user2@gmail.com", username: "User2", password: Passwords.defPassword, admin: true);
        if (User.count() == 0) {
            if (user.validate())
                user.save(flush: true, failOnError: true)
            else
                log.error("Could not Validate")

            if (admin.validate()) {
                User userReturned = admin.save(flush: true, failOnError: true)
                log.info(userReturned)
            } else
                log.error("Could not Validate")
        } else {
            Log.info("Users already Exists")
        }
    }

    void createTopics() {
        User creater = User.findByFirstname("User1")
        if (Topic.countByCreatedBy(creater) == 0) {
            Topic topic1 = new Topic(name: "Grails", createdBy: creater, visibility: Visibility.PUBLIC).save()
            Topic topic2 = new Topic(name: "DevOps", createdBy: creater, visibility: Visibility.PUBLIC).save()
            Topic topic3 = new Topic(name: "AMC", createdBy: creater, visibility: Visibility.PUBLIC).save()
            Topic topic4 = new Topic(name: "Java", createdBy: creater, visibility: Visibility.PUBLIC).save()
            Topic topic5 = new Topic(name: "MeanStack", createdBy: creater, visibility: Visibility.PUBLIC).save()
        } else {
            Log.info("User already has 5 topics")
        }
    }

    void createResources() {
        List topicList = Topic.getAll();

        if (Resource.count() == 0) {
            topicList.each {
                Resource docResource1 = new DocumentResource(description: it.name, topic: it, createdBy: it.createdBy, filePath: "ftp://ftp.funet.fi/pub/standards/RFC/rfc959.txt").save()
                Resource docResource2 = new DocumentResource(description: it.name, topic: it, createdBy: it.createdBy, filePath: "ftp://ftp.funet.fi/pub/standards/RFC/rfc960.txt").save()
                Resource linkResource1 = new LinkResource(description: it.name, topic: it, createdBy: it.createdBy, url: "hhttps://en.wikipedia.org/wiki/Main_Page").save()
                Resource linkResource2 = new LinkResource(description: it.name, topic: it, createdBy: it.createdBy, url: "http://www.encyclopedia.com/").save()
            }
        } else {
            Log.info("Resource count greater than zero")
        }
    }

    void subscribeTopic() {
        User subscriber = User.findByFirstname("User2")
        List topicsNotCreated = Topic.findAllByCreatedByNotEqual(subscriber)
        topicsNotCreated.each {
            if (Subscription.countByUserAndTopic(subscriber, it) == 0) {
                Subscription subscription = new Subscription(seriousness: Seriousness.VERYSERIOUS, user: subscriber, topic: it).save()
            } else {
                Log.info("${subscriber.fullName} is already subscribed to ${it.name}")
            }
        }
    }

    void createReadingItems() {
        User user = User.findByFirstname("User2")
        List resourceNotCreated = Resource.findAllByCreatedByNotEqual(user)

        resourceNotCreated.each {
            if (Subscription.countByUserAndTopic(user, it.topic) > 0) {
                if (ReadingItem.countByUserAndResource(user, it) == 0)
                    ReadingItem readingItem = new ReadingItem(isRead: false, resource: it, user: user).save()
                else
                    Log.info("${user.fullName} already has this Reading Item in his list")
            } else {
                Log.info("User is not subscribed to this topic")
            }
        }
    }

    void createResourceRating()
    {
        User user = User.findByFirstname("User2")
        List unRead = ReadingItem.findAllByUserAndIsRead(user,false)
        if(unRead.size()>0) {
            unRead.each {
                ResourceRating rating = new ResourceRating(score: 5, user:user, resource: it.resource).save()
            }
        }
        else
        {
            Log.info("All the reading item has been read")
        }

    }
    def destroy = {
    }
}
