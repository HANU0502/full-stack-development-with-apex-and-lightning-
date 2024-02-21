public with sharing class Mailing {

   public static void sendEmail(){
       //We instantiate our single email message object
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

       // Strings to hold the email addresses to which you are sending the email.
       List<String> toAddresses = new List<String> {'Mousumi.Sahu1@ibm.com'};
       //Assign the TO address to our mail object
       mail.setToAddresses(toAddresses);

       // Set the subject line for your email address.
       mail.setSubject('Dekho mail aaya?');

       // You can specify your plain text here
       mail.setPlainTextBody('Ha ya na?');

       //Specify any html - for example this will display a link in the email
       mail.setHtmlBody('Yes we can');

       // Send the email
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   }
}