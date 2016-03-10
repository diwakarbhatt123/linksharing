package linksharing

import org.springframework.web.multipart.MultipartFile

class DocumentResourceController extends ResourceController {

    def index() {}
    def save(String description, String topic) {
        MultipartFile inputDocument = params.document
        String extension = inputDocument.originalFilename.tokenize(".")?.last()
        String filePath = "${grailsApplication.config.documentFolder}/${UUID.randomUUID().toString()}${extension ? ".${extension}" : ""}"
        File resourceDocument = new File(filePath)
        inputDocument.transferTo(resourceDocument)
        User createdBy = session.user
        Resource resource = new DocumentResource(filePath: resourceDocument.absolutePath, description: description, topic: Topic.findByName(topic), createdBy: createdBy)
        if (resource.validate()) {
            flash.message = "Success"
            resource.save()
            ResourceController.addToReadingItems(resource)
        } else {
            flash.error = "Resource could not be saved"
        }
        redirect(controller: "user", action: "index")
    }
    def downloadDocument(long id)
    {
        Resource resource = Resource.read(id)
        String filePath = resource.filePath
        File file = new File(filePath)
        byte[] documentBytes = file.bytes
        response.setHeader("Content-length",documentBytes.length.toString())
        response.outputStream << documentBytes
        response.outputStream.flush()
    }

}
