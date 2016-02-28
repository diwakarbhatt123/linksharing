package linksharing

enum Visibility {
    PUBLIC, PRIVATE
    static Visibility toEnum(String visibility)
    {
        if(visibility.equals("public"))
        {
            return PUBLIC
        }
        else if(visibility.equals("private"))
        {
            return PRIVATE
        }
    }
}
