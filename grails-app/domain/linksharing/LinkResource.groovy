package linksharing

class LinkResource extends Resource {
    String url
    static constraints = {
        url (url: true)
    }

    @Override
    String toString() {
        "Description:${description},Url:${url}"
    }
}
