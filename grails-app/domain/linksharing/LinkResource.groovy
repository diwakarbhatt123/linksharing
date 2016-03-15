package linksharing

class LinkResource extends Resource {
    String url
    static constraints = {
        url (url: true,blank:false)
    }

    @Override
    String toString() {
        "Description:${description},Url:${url}"
    }
}
