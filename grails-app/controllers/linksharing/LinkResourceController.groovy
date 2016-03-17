package linksharing

class LinkResourceController extends ResourceController {

    def index() {}
    def save(String url, String description, String topic) {
        User createdBy = session.user
        Resource resource = new LinkResource(url: url, description: description, topic: Topic.findByName(topic), createdBy: createdBy)
        if (resource.validate()) {
            flash.message = "Success"
            resource.save()
        } else {
            flash.error = "Resource could not be saved"
        }
        redirect(url:"/")
    }

}
