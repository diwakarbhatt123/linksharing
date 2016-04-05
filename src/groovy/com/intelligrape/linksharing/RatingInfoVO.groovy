package com.intelligrape.linksharing

import grails.validation.Validateable

class RatingInfoVO {
    Integer totalVotes
    Integer averageScore
    Integer totalScore

    @Override
    String toString() {
     "Total Votes:${totalVotes},Average Score:${averageScore},Total Score:${totalScore}"
    }
}
