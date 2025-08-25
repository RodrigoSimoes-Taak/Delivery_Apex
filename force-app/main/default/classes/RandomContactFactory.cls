public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(integer quantContacts, string commonLastName) {
        List<Contact> newContacts = new List<Contact>();

        for(integer i = 0; i < quantContacts; i++) {
            Contact newContact = new Contact(FirstName = 'Test ' + i, LastName = commonLastName);
            newContacts.add(newContact);
        }

        insert newContacts;
        return newContacts;
    }

}