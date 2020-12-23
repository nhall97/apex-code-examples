public  class removeMatchingStringsFromListOfRecords {
    public static void removeMatchingStringsFromListOfRecords() {
        //Use case:
            //You've got a set of data where you've got accidently duplicates - and want to split it into Unique vs Dups
            //In this example - you've inserted the same DataLoad twice - and now your contact table has duplicate values.

        //Firstly, identify a list where you may have matching things eg. Name, email, etc.
        List<Contact> listOfContacts = [SELECT Id, Name FROM Contact];
        
        //We will split the list into two seperate Sets - one with unqiue, one with duplicate
        Set<Contact> setOfUnqiueContactNames = new Set<Contact>();
        Set<Contact> setOfDuplicateContactNames= new Set<Contact>();

        //For for element in the list, we loop through 
        //We use the set contains the method to quickly decide - 
            //If the setOfUnqiueContactNames contains the Contact's name already - we add it to the setOfDuplicateContactNames
            //If the setOfUniqueContactNames does not contain, we add it to the uniqueContactNames in line #22

        for(Contact ctc : listOfContacts)
        {
            if(setOfUnqiueContactNames.contains(ctc.Name))
            {
                setOfDuplicateContactNames.add(ctc);
            } else {
                setOfUnqiueContactNames;
            }
        }

        //you can do stuff with your list of unique contacts
        sendEmails(setOfUnqiueContactNames);        

        //you can do stuff with your list of duplicates - remember for deleting, you must have the Id
        delete setOfDuplicateContactNames.Id;
    }
}
