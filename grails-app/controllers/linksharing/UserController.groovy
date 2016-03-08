package linksharing

import com.intelligrape.linksharing.TopicVO
import jline.internal.Log


class UserController {

    def index() {
       List<TopicVO> trendingTopics = Topic.trendingTopic
       render(view:"user",model:[trendingTopics:trendingTopics])
    }
    def usershow()
    {
         List<User> userList = User.list([max:10])
        render(view:"usershow",model:[userList:userList])
    }
}
