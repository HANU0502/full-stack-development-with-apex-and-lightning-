public with sharing class TodoController {
    @AuraEnabled
    public static ToDo__c saveTodo(String title,date dueDate){
        try {

            ToDo__c todo = new ToDo__c();
            todo.Title__c = title;
            todo.Due_Date__c = dueDate;
            insert todo;
            return todo;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(Cacheable=true)
    public static List<ToDo__c> getTodoList(String Status){
       return [SELECT Id, Name, CreatedDate, CreatedById, Title__c, Due_Date__c, Status__c, LastViewedDate, LastModifiedDate FROM ToDo__c Where Status__c=:Status ORDER BY Due_Date__c];
    }
      
}