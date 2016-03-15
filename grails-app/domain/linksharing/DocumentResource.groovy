package linksharing

class DocumentResource extends Resource {
    String filePath
    static constraints = {
     filePath(blank:false)
    }
    @Override
    String toString() {
        "Description:${description},filepath:${filePath}"
    }
}
