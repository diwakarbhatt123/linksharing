package linksharing

import com.intelligrape.linksharing.EmailDTO
import grails.transaction.Transactional

@Transactional
class EmailService {
   def mailService
    def sendMail(EmailDTO emailDTO)
    {
        sendMail{
            async true
            to emailDTO.to.toArray()
            subject emailDTO.subject
            if(emailDTO.content)
            body emailDTO.content
            else
            body(view:emailDTO.view,model:emailDTO.model)
        }
    }
    def sendUnreadResourcesEmail(List unReadResources){
        unReadResources.each {unReadResource ->
            EmailDTO emailDTO1 = new EmailDTO(to:unReadResource[1],subject:"Unread Posts",content:"You have unread posts from your subscribed topic ${unReadResource[0]}")
            sendMail(emailDTO1)
        }
    }
}
