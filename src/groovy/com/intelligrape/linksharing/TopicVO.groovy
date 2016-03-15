package com.intelligrape.linksharing

import linksharing.User

class TopicVO {
    long id
    String name
    Visibility visibility
    int count
    User createdBy
    int subscribers
    @Override
    String toString() {
       "ID:${id},Name:${name},Visibility:${visibility},Count:${count},Created By:${createdBy.fullName},Subscribers:${subscribers}\n"
    }
}
