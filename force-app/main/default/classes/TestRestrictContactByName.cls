@isTest
public class TestRestrictContactByName {
    @isTest 
    static void testInsertAccountInvalidData() {
        Contact textContact = new Contact(LastName = 'INVALIDNAME');

        Test.startTest();
        Database.SaveResult result = Database.insert(textContact, false);
        Test.stopTest();
    }

}