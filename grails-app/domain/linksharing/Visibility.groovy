package linksharing

enum Visibility {
    PUBLIC("Public"), PRIVATE("Private")
    private String nameAsString
    private Visibility(String nameAsString)
    {
        this.nameAsString = nameAsString
    }
    static Visibility toEnum(String visibility)
    {
        if(visibility.equalsIgnoreCase("public"))
        {
            return PUBLIC
        }
        else if(visibility.equalsIgnoreCase("private"))
        {
            return PRIVATE
        }
    }

    @Override
    String toString() {
       return this.nameAsString
    }
}
