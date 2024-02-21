public with sharing class AccountController {
    public AccountController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        System.debug('Account'+[SELECT Id, Name, Type, Industry FROM Account]);
       return [SELECT Id, Name, Type, Industry FROM Account];
    }

    @AuraEnabled
    public static List<Account> getAccountsRecordList(){
        System.debug('Account'+[SELECT Id, Name, Type, Industry FROM Account]);
       return [SELECT Id, Name,Phone, Type,Sic,BillingState, Industry FROM Account];
    }
}