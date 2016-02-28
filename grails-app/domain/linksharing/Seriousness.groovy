package linksharing

enum Seriousness
{
    SERIOUS, VERYSERIOUS, CASUAL

    static Seriousness getSeriousness(String seriousness)
    {
        if(seriousness.equals("serious"))
        {
            return SERIOUS
        }
        else if(seriousness.equals("very serious"))
        {
            return VERYSERIOUS
        }
        else if(seriousness.equals("casual"))
        {
            return CASUAL
        }
    }
}
