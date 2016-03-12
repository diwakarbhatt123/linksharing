package linksharing

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class PhotoUploaderService {
 def grailsApplication
    def uploadPicture(MultipartFile photo) {
        MultipartFile inputImage = photo
        String extention = inputImage.originalFilename.tokenize(".")?.last()
        String filePath = "${grailsApplication.config.userImageFolder}/${UUID.randomUUID().toString()}${extention?".${extention}":""}"
        File userImage = new File(filePath)
        inputImage.transferTo(userImage)
        return userImage.absolutePath
    }
}
