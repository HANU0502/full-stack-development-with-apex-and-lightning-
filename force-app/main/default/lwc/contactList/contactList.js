import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import { reduceErrors } from 'c/ldsUtils';


const COLUMNS = [
    { label: 'First Name', fieldName: FirstName.fieldApiName, type: 'text' },
    { label: 'Last Name', fieldName: LastName.fieldApiName, type: 'text' },
    { label: 'Email', fieldName: Email.fieldApiName, type: 'text' }
];

export default class ContactList extends LightningElement {

    coulums = COLUMNS;
    //@track contacts = [];

    
    
    @wire(getContacts)
    contact; 
    get errors() {
        return (this.accounts.error) ?
            reduceErrors(this.accounts.error) : [];
    }   

}