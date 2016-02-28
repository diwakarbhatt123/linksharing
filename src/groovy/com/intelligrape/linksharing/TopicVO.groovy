package com.intelligrape.linksharing

import linksharing.User
import linksharing.Visibility

class TopicVO {
    long id
    String name
    Visibility visibility
    int count
    User createdBy

    @Override
    String toString() {
       "ID:${id},Name:${name},Visibility:${visibility},Count:${count},Created By:${createdBy.fullName}\n"
    }
}
