package com.intelligrape.linksharing

class RandomPasswordGenerator {
static generateRandomPassword()
{
    return new Random().nextInt(100000)
}
}
