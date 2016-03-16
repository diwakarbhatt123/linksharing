package linksharing

class ReadingItem {

    boolean isRead
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user:User,resource:Resource]
    static constraints = {
        isRead(nullable:false)
        resource(nullable: false)
        user(nullable: false,unique:'resource')
    }

    static List unReadPosts(){
        List unReadResources = ReadingItem.createCriteria().list{
            projections{
                'resource'{
                    'topic'{
                        property("name")
                    }
                }
                'user'{
                    property("email")
                }
            }
            eq("isRead",false)
        }.unique();
        return unReadResources
    }

    @Override
    String toString() {
        "${user}&${resource}"
    }
}
