package linksharing

class DocumentResource extends Resource {

    String filePath
    static constraints = {

    }

    @Override
    String toString() {
        "Description:${description},filepath:${filePath}"
    }
}
