package com.intelligrape.linksharing

class UserCO {
    String email
    String username
    String password
    String firstname
    String lastname
    String confirmPassword
    String city
    String country
    String bio


    @Override
    public String toString() {
        return "UserCO{" +
                "email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", bio='" + bio + '\'' +
                '}';
    }
}
