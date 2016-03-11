package linksharing

enum Seriousness
{
    SERIOUS("Serious"), VERYSERIOUS("Very Serious"), CASUAL("Casual")
    private String nameAsString
    private Seriousness(String nameAsString)
    {
       this.nameAsString = nameAsString
    }
    static Seriousness getSeriousness(String seriousness)
    {
        if(seriousness.equalsIgnoreCase("serious"))
        {
            return SERIOUS
        }
        else if(seriousness.equalsIgnoreCase("very serious"))
        {
            return VERYSERIOUS
        }
        else if(seriousness.equalsIgnoreCase("casual"))
        {
            return CASUAL
        }
    }

    @Override
    String toString() {
      return this.nameAsString
    }
}
