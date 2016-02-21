package linksharing

class MyController {

    def index() {
        Topic topic = new Topic(name: "Grails",visibility: Visibility.PUBLIC)
        User user = new User(firstname: "Diwakar",lastname: "Bhatt",email: "diwakarbhatt@gmail.com",username: "diwakarbhatt",password: 1234).addToTopics(topic).save()
        render user.count()

        (0..10).each()

    }
}
