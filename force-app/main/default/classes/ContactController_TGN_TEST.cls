/* Generated by TestGen on Tue Jan 30 2024 at 3:55 PM (GMT) */
@isTest
private class ContactController_TGN_TEST{
    @isTest
    private static void getContacts_TGN_TEST(){
        Database.SaveResult dsr;
        Contact drContact;
        drContact=new Contact();
        dsr=Database.insert(drContact,false);
        Test.startTest();
        ContactController.getContacts();
        Test.stopTest();
    }
    @isTest
    private static void ContactController_TGN_TEST(){
        ContactController obj = new ContactController();
    }
}