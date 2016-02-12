package linksharing

import java.sql.SQLType

class User {

    String email
    String username
    String password
    String firstname
    String lastname
    SQLType photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static transients = ['fullname']
    String getFullName()
    {
        "${firstname} ${lastname}"
    }
    static constraints = {
        email (unique: true, email: true, nullable: false, blank: false)
        password (size: 0..5, nullable: false, blank: false)
        firstname (nullable: false)
        lastname (nullable: false)
        photo (nullable: true)
        admin (nullable: true)
        active (nullable: true)
    }
}
