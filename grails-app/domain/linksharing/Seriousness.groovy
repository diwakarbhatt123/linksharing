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

    @Override
    String toString() {
      return this.nameAsString
    }
}
