package com.intelligrape.linksharing

class RatingInfoVO {
    Integer totalVotes
    Integer averageScore
    Integer totalScore

    @Override
    String toString() {
     "Total Votes:${totalVotes},Average Score:${averageScore},Total Score:${totalScore}"
    }
}
