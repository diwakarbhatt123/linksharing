package linksharing



class UnreadItemEmailJob {
    def emailService
    static triggers = {
        simple name:'simpleTrigger', repeatInterval: 604800000, repeatCount: -1
        cron name: 'myTrigger', cronExpression: " 0 0 13 ? ? ?"
    }

    def execute() {
      List unreadResources = ReadingItem.unReadPosts()
      emailService.sendUnreadResourcesEmail(unreadResources)
    }
}
