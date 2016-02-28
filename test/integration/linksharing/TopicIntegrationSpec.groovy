package linksharing

import grails.test.spock.IntegrationSpec

class TopicIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "Trending Topics Test"() {
        when:
        List list = Topic.trendingTopic
        then:
        !list.isEmpty()
    }
}
