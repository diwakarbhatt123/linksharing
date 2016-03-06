package linksharing

enum Visibility {
    PUBLIC, PRIVATE
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
}
