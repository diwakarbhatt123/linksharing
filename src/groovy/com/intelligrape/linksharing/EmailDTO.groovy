package com.intelligrape.linksharing

import grails.validation.Validateable
import linksharing.User

@Validateable
class EmailDTO {
    List<String> to
    String view
    String subject
    String content
    Map model

    static constraints = {
        model(nullable: true)
        to(nullable: false)
        view(nullable: true)
        subject(nullable: false)
        content(nullable:true)
    }
}

