public class SendMailing{

        public void sendMail()
        {
                String htmlHead = '<html><head><style>body{font-family: Calibri;}td{text-align:center;min-width:100px;height:30px;font-family: Calibri;font-size:95%;}th{height:30px;}</style></head>';                
                String welcomeMsg = '<body><p style="font-size:95%;font-family: Calibri;color:#003366;" >Report'+  Date.today().addDays(-1).format() +'.</p>';
                string signature ='</br><p style="font-size:90%;font-family: Calibri;color:#003366" >'+URL.getSalesforceBaseUrl().toExternalForm()+'</p></body></p></html>';  
                String apexjobsbody = apexJobsMethod();  
                String ApiRequest = ApiRequest();                
                String dataStorageBody = dataStoragemethod();
                
                String CurrentFileStorage = CurrentFileStorage();
                String remainingUrsLicense = userLicenseMethod(); 
                String FeatureLicenses = FeatureLicenses();       
                
                String messageBody =htmlHead+welcomeMsg; 
                if(apexjobsbody!='')
                {
                     messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b> Failed Apex Jobs: </b>'+ apexjobsbody;   
                }   
                else
                {
                    messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#FF3333" ><b> No Failed Apex Jobs </b>';   
                } 
        
                messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b>API Requests, Last 24 Hours	: </b>'+ ApiRequest + '</p>';
        
                messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b>Data Storage : </b>'+ dataStorageBody  + '</p>';
        
                messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b>Current File Storage Usage: </b>'+ CurrentFileStorage + '</p>';
        
        
                messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b>Feature Licenses: </b>'+ FeatureLicenses + '</p>';
                messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b> User Licenses: </b>'+ remainingUrsLicense + '</p>';        
               
                String CurrentDataStorage = CurrentDataStorage();
                messageBody+= '<p style="font-size:95%;font-family:Calibri;color:#1f497d" ><b>Current Data Storage Usage : </b>'+ CurrentDataStorage + '</p>';
        
                messageBody+= signature;
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();        
                String[] toAddresses = new String[] {'Padmanabham.Padmanabham@ibm.com'};
                //List<OrgWideEmailAddress> lstEmailAddress=[select Id from OrgWideEmailAddress];
               // mail.setUseSignature(false);        
                mail.setToAddresses(toAddresses); 
               // mail.setOrgWideEmailAddressId(lstEmailAddress[0].Id); 
                System.debug('ToAddress'+toAddresses);
                System.debug('ToAddress'+toAddresses);
                mail.setSubject('Report -' + Date.today().addDays(-1).format());
                mail.setHtmlBody(messageBody);              
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });              		    
            } 
                   
            
        
            /*This method fetches the data storage information*/
        
            public static String dataStoragemethod()
            {        
                String storageBody;
                PageReference pr=new PageReference('/setup/org/orgstorageusage.jsp?id=' + UserInfo.getOrganizationId() + '&setupid=CompanyResourceDisk');
                string rawData;
                //The below conditon is added for test class
                if(Test.isRunningTest()) 
                { 
                    rawData = String.valueOf('storage usage is listed below.</div> Unit.Test');
                } 
                else 
                {
                    rawData=pr.getContent().toString();
                }
                System.debug('Data Storage raw data'+rawData);
                //Locate the Storage table within the raw data which comes after the below line
                List<String> temp = rawData.split('storage usage is listed below.</div>');
                System.debug('Temp data storage'+temp[0]);
                System.debug('Temp data storage'+temp[1]);
                String UsrLicTab = temp[1];
                storageBody = UsrLicTab.substringBetween('<table', '</table>');
                System.debug('UsrLicTab body'+UsrLicTab);   
                storageBody ='<table'+ storageBody +'</table>';    
                //System.debug('storage body'+storageBody);     
                //Replacing the existing table style
                String Style1 = '<table class="list" border="0" cellspacing="0" cellpadding="0"><tr class="headerRow">';
                String Style2 = '<table border="2" style="border-collapse: collapse;text-align:center;"><tr style="background-color:#04448C;color:white;">';
                storageBody = storageBody.replace(Style1, Style2);
                return storageBody;
            }
        
        
            /*This method fetches the Current data storage Usage information*/
            public static String CurrentDataStorage()
            {        
                String dataStorage;
                PageReference pr=new PageReference('/setup/org/orgstorageusage.jsp?id=' + UserInfo.getOrganizationId() + '&setupid=CompanyResourceDisk');
                string rawData;
                //The below conditon is added for test class
                if(Test.isRunningTest()) 
                { 
                    rawData = String.valueOf('Current Data Storage Usage Unit.Test');
                } 
                else 
                {
                    rawData=pr.getContent().toString();
                }
                
                //Locate the Storage table within the raw data which comes after the below line
                List<String> temp = rawData.split('Current Data Storage Usage');
                String UsrLicTab = temp[1];
                //System.debug('UsrLicTab'+UsrLicTab);
                dataStorage = UsrLicTab.substringBetween('<table', '</table>');
                
                
                //Replacing the existing table style
               
                // dataStorage  = dataDeleted(dataStorage);
                //dataStorage = dataStorage.remove('')
        
                System.debug(dataStorage);
        
                dataStorage ='<table'+ dataStorage+'</table>';
                String Style1 = '<table class="list" border="0" cellspacing="0" cellpadding="0"><tr class="headerRow">';
                String Style2 = '<table border="2" style="border-collapse: collapse;text-align:center;"><tr style="background-color:#04448C;color:white;">';
                dataStorage =   dataStorage.replace(Style1,Style2);
                return dataStorage;
                
            }
        
            public static String CurrentFileStorage()
            {        
                String storageBody;
                PageReference pr=new PageReference('/setup/org/orgstorageusage.jsp?id=' + UserInfo.getOrganizationId() + '&setupid=CompanyResourceDisk');
                string rawData;
                //The below conditon is added for test class
                if(Test.isRunningTest()) 
                { 
                    rawData = String.valueOf('Current File Storage Usage Unit.Test');
                } 
                else 
                {
                    rawData=pr.getContent().toString();
                }
                
                //Locate the Storage table within the raw data which comes after the below line
                List<String> temp = rawData.split('Current File Storage Usage');
                String UsrLicTab = temp[1];
                storageBody = UsrLicTab.substringBetween('<table', '</table>');
                storageBody ='<table'+ storageBody +'</table>';         
                //Replacing the existing table style
                String Style1 = '<table class="list" border="0" cellspacing="0" cellpadding="0"><tr class="headerRow">';
                String Style2 = '<table border="2" style="border-collapse: collapse;text-align:center;"><tr style="background-color:#04448C;color:white;">';
                storageBody = storageBody.replace(Style1, Style2);
                return storageBody;
            }
        
            /*This method fetches the remaining user Licenses in the Org*/
            public static String userLicenseMethod()
            {        
                String remaininglicense ;
                PageReference pr=new PageReference('/'+UserInfo.getOrganizationId());
                string rawData;
                //The below conditon is added for test class
                if(Test.isRunningTest()) 
                { 
                    rawData = String.valueOf('User Licenses</h3></td> Unit.Test');
                } 
                else 
                {
                    rawData=pr.getContent().toString();
                }
                //Locate the User Licenses table within the raw data which comes after the below line
                List<String> temp = rawData.split('User Licenses</h3></td>');
                String UsrLicTab = temp[1];
                remaininglicense = UsrLicTab.substringBetween('<table', '</table>');
                //System.debug(remaininglicense);
                //remaininglicense = deletedUserLicence(remaininglicense);
                System.debug(remaininglicense);
                remaininglicense ='<table'+ remaininglicense +'</table>';        
                //Replacing the existing table style
                String Style1 = '<table class="list" border="0" cellspacing="0" cellpadding="0"><tr class="headerRow">';
                String Style2 = '<table border="2" style="border-collapse: collapse;"><tr style="background-color:#04448C;color:white;">';
                remaininglicense = remaininglicense.replace(Style1, Style2);
                return remaininglicense;
                
            }
        
            /*This method will return last 24 hrs API Request that ran yesterday*/ 
        
            public static String ApiRequest()
            {        
                String apiValue ;
                PageReference pr=new PageReference('/'+UserInfo.getOrganizationId());
                string rawData;
                //The below conditon is added for test class
                 if(Test.isRunningTest()) 
                 { 
                     rawData = String.valueOf('API Requests, Last 24 Hours</td> Unit.Test');
                 } 
                 else 
                 {
                     rawData=pr.getContent().toString();
                 }
                List<String> temp = rawData.split('API Requests, Last 24 Hours</td>');
                String UsrLicTab = temp[1];
                apiValue = UsrLicTab.substringBetween('class="dataCol">','</td>');      
                return apiValue;
                
            } 
        
            public static String FeatureLicenses()
            {        
                String remaininglicense ;
                PageReference pr=new PageReference('/'+UserInfo.getOrganizationId());
                string rawData;
                //The below conditon is added for test class
                if(Test.isRunningTest()) 
                { 
                    rawData = String.valueOf('Feature Licenses</h3></td> Unit.Test');
                } 
                else 
                {
                    rawData=pr.getContent().toString();
                }
                //Locate the User Licenses table within the raw data which comes after the below line
                List<String> temp = rawData.split('Feature Licenses</h3></td>');
                String UsrLicTab = temp[1];
                remaininglicense = UsrLicTab.substringBetween('<table', '</table>');
                remaininglicense ='<table'+ remaininglicense +'</table>';        
                //Replacing the existing table style
                String Style1 = '<table class="list" border="0" cellspacing="0" cellpadding="0"><tr class="headerRow">';
                String Style2 = '<table border="2" style="border-collapse: collapse;"><tr style="background-color:#04448C;color:white;">';
                remaininglicense = remaininglicense.replace(Style1, Style2);
                return remaininglicense;
                
            }
        
            
            /*This method fetches all the jobs that ran yesterday*/ 
            public static String apexJobsMethod()
            {
                List<AsyncApexJob> asynjobs = [SELECT Id, CreatedDate,ApexClass.Name, CompletedDate,Status, NumberOfErrors, TotalJobItems, JobItemsProcessed
                                               FROM AsyncApexJob WHERE CreatedDate = YESTERDAY AND ApexClass.Name != 'LiveChatHealthCheckReport'order by createddate DESC];
                
                String messagebody = '';
                if(asynjobs.size()>0)
                {
                    for(AsyncApexJob asyn:asynjobs)
                    {
                        String jobcompleteddate =  null;
                        if(asyn.CompletedDate != null)
                        {
                            jobcompleteddate = asyn.CompletedDate.format('MM/dd/yyyy HH:mm:ss','America/New_York');
                        }
                        if(asyn.Status == 'Failed' || asyn.Status == 'Aborted')
                        {                    
                            messagebody+= '<tr><th>' + asyn.Id + '</th><td>' + asyn.ApexClass.Name + '</td><td>' + asyn.CreatedDate.format('MM/dd/yyyy HH:mm:ss','America/New_York') + '</td><td>'+ jobcompleteddate + '</td><td>' + asyn.Status +'</td><td>' + asyn.NumberOfErrors +'</td><td>' + asyn.TotalJobItems +'</td><td>' + asyn.JobItemsProcessed +'</td></tr>'; 
                        }               
                    }
                }        
                String asyncBody='';
                if(messageBody!='')
                {
                    asyncBody ='<table border="2" style="border-collapse: collapse;"><tr style="background-color:#FF3333;color:white;"><th>Job ID</th><th>Apex Class Name</th><th>Created Date</th><th>Completed Date</th><th>Status</th><th>Number Of Errors</th><th>Total Job Items</th><th >Job Items Processed</th></tr>';            
                    asyncBody+= messageBody+'</table>';
                }        
                return asyncBody;        
            }   
}