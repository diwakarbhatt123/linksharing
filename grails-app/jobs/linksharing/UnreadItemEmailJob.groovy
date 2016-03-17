package linksharing



class UnreadItemEmailJob {
    def emailService
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0 0 18 ? * SAT *"
    }

    def execute() {
      List unreadResources = ReadingItem.unReadPosts()
      emailService.sendUnreadResourcesEmail(unreadResources)
    }
}
