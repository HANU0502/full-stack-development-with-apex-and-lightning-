public without sharing class testNewClass {
    public static final String VIPACCESS = 'VIP Access';
    public static final String GRANTVIPACCESS = 'Grant Speciality Access';
    public static final String REMOVEVIPACCESS = 'Remove Speciality Access';
    
    @AuraEnabled(Cacheable = true)
    public static List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> getUserList(String ftName,String ltName) {
        List<User> usrList = new List<User>();
        List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> userList = new List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass>();
        try{
            
            String fName = String.isBlank(ftName)?'':ftName;
            String lName =  String.isBlank(ltName)?'':ltName;
            //System.debug('@@@@fName  '+fName +'@@@lName  '+lName);
            //String organizationName =  String.isBlank(system.Label.NW_EC_Organization)?'':system.Label.NW_EC_Organization;
            String whereClause ='';
            String query = 'SELECT Id,Name,FirstName,LastName from User';
            if(fName !='' && lName !=''){
                whereClause = 'WHERE FirstName =:fName AND LastName =:lName';
            } else if(fName !='' && lName ==''){
                whereClause = 'WHERE FirstName LIKE \''+'%'+String.escapeSingleQuotes(fName.trim())+'%'+'\'';
            } else if(fName ==''&& lName !=''){
                System.debug('lName@@@'+lName);
                whereClause =  'WHERE LastName LIKE \'%'+String.escapeSingleQuotes(lName.trim())+'%\'';   
            }
            
            System.debug('whereClause  '+whereClause);
            if(whereClause!=''){
                whereClause = whereClause + ' AND NW_EC_Organization__c =:organizationName';
                query = query+' '+whereClause;
                System.debug('query'+query);
                usrList = Database.query(query);
                System.debug('accList'+usrList);
                for(User usr : usrList){
                    NW_EC_DataTransferObjectClass.UserWithGroupMemberClass userGrp = new NW_EC_DataTransferObjectClass.UserWithGroupMemberClass();
                    userGrp.firstName = usr.FirstName;
                    userGrp.lastName = usr.LastName;
                    userGrp.userId = usr.Id;
                    
                    List<GroupMember> userGMList = new List<GroupMember>([select Id,GroupId, Group.Name from GroupMember where UserOrGroupId =: usr.Id]);
                    if(userGMList.size() == 0){
                        userGrp.groupAction = GRANTVIPACCESS;
                        userGrp.isVIP = false;
                    }else {
                        userGrp.groupAction = REMOVEVIPACCESS;
                        userGrp.isVIP = true;
                    }
                    userList.add(userGrp);
                }
            }
        }
        catch(Exception ex){
            //NW_ErrorHandler.logFullError('nw_ec_UserSpecialAccessController.getUserList', ex.getMessage(), ex.getStackTraceString(), true);
            throw new System.AuraHandledException(ex.getMessage());
        }
        return userList;
    }
    
    
    @AuraEnabled
    public static List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> assignVIPGroup(String userId,String fName,String lName) {
        
        List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> userList = new List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass>();
        try{
            Group grp = [select Id,Name from Group Where Name =: VIPACCESS limit 1];           
            GroupMember gm = new GroupMember(); 
            gm.GroupId = grp.id;
            gm.UserOrGroupId = userId;        
            
            insert gm;
            userList = prepareUserList(userId,fName,lName);
        } catch(Exception ex){
            //NW_ErrorHandler.logFullError('nw_ec_UserSpecialAccessController.assignVIPGroup', ex.getMessage(), ex.getStackTraceString(), true);
            throw new System.AuraHandledException(ex.getMessage());
        }        
        return userList; 
    }
    @AuraEnabled
    public static List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> removeVIPGroup(String userId,String fName,String lName) {
        List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> userList = new List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass>();
        try{
            List<GroupMember> deletrGM = new List<GroupMember>([select Id,GroupId, Group.Name from GroupMember where UserOrGroupId =: userId]);
            delete deletrGM; 
            userList = prepareUserList(userId,fName,lName);
        } catch(Exception ex){
            //NW_ErrorHandler.logFullError('nw_ec_UserSpecialAccessController.removeVIPGroup', ex.getMessage(), ex.getStackTraceString(), true);
            throw new System.AuraHandledException(ex.getMessage());
        }        
        return userList;
    }
    
    public static List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> prepareUserList(String userId,String ftName,String ltName) {
        
        List<User> usrList = new List<User>();
        List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass> userList = new List<NW_EC_DataTransferObjectClass.UserWithGroupMemberClass>();
        try{
            
            String fName = String.isBlank(ftName)?'':ftName;
            String lName =  String.isBlank(ltName)?'':ltName;
            //String organizationName =  String.isBlank(system.Label.NW_EC_Organization)?'':system.Label.NW_EC_Organization;
            String whereClause ='';
            String query = 'SELECT Id,Name,FirstName,LastName,	NW_EC_Role__c,NW_EC_Organization__c from User';
            if(fName !='' && lName !=''){
                whereClause = 'WHERE FirstName =:fName AND LastName =:lName';
            } else if(fName !='' && lName ==''){
                whereClause = 'WHERE FirstName LIKE \''+'%'+String.escapeSingleQuotes(fName.trim())+'%'+'\'';
            } else if(fName ==''&& lName !=''){
                System.debug('lName@@@'+lName);
                whereClause =  'WHERE LastName LIKE \'%'+String.escapeSingleQuotes(lName.trim())+'%\'';   
            }
            
            System.debug('whereClause  '+whereClause);
            if(whereClause!=''){
                whereClause = whereClause + ' AND NW_EC_Organization__c =:organizationName';
                query = query+' '+whereClause;
                System.debug('query'+query);
                usrList = Database.query(query);
                for(User usr : usrList){
                    NW_EC_DataTransferObjectClass.UserWithGroupMemberClass userGrp = new NW_EC_DataTransferObjectClass.UserWithGroupMemberClass();
                    userGrp.firstName = usr.FirstName;
                    userGrp.lastName = usr.LastName;
                    //userGrp.role = usr.NW_EC_Role__c;
                    userGrp.userId = usr.Id;
                    
                    List<GroupMember> userGMList = new List<GroupMember>([select Id,GroupId, Group.Name from GroupMember where UserOrGroupId =: usr.Id]);
                    if(userGMList.size() == 0){
                        userGrp.groupAction = GRANTVIPACCESS;
                        userGrp.isVIP = false;
                    }else {
                        userGrp.groupAction = REMOVEVIPACCESS;
                        userGrp.isVIP = true;
                    }
                    userList.add(userGrp);
                }
            }
        }
        catch(Exception ex){
            //NW_ErrorHandler.logFullError('nw_ec_UserSpecialAccessController.prepareUserList', ex.getMessage(), ex.getStackTraceString(), true);
            throw new System.AuraHandledException(ex.getMessage());
        }		
        
        return userList;
    }
}