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
    public static List<ToDo__c> getTodoList(String taskStatus){
       return [SELECT Id, Name, CreatedDate, CreatedById, Title__c, Due_Date__c, Status__c, LastViewedDate, LastModifiedDate FROM ToDo__c Where Status__c=:taskStatus ORDER BY Due_Date__c];
    }

    @AuraEnabled
    public static string updateTaskStatus(Id taskId){
        try {
            ToDo__c todo = [Select Id , Status__c From ToDo__c where Id=:taskId];
            todo.Status__c = 'Completed';
            update todo;
            return 'Success';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string deleteTask(Id taskId){
        try {
            ToDo__c todo = [Select Id,Title__c From ToDo__c where Id=:taskId];
           // string name = todo.Title__c;
            delete todo;
            return todo.Title__c;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
      
}