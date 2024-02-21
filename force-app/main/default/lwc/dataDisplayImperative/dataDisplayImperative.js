import getAccounts from '@salesforce/apex/AccountController.getAccountsRecordList';
import { LightningElement, track } from 'lwc';

export default class DataDisplayImperative extends LightningElement {
    @track accountRecords;
    @track error;
    @track  columns = [
        {label : 'Name', fieldName:'Name', type:'text'},
        {label : 'Phone', fieldName:'Phone', type:'Phone'},
        {label : 'Industry', fieldName:'Industry', type:'text'},
        {label :'Sicsss', fieldName:'Sic', type:'text'},
        {label :'Billing State', fieldName:'BillingState', type:'text'},
        
    ]
    connectedCallback(){
        getAccounts()
        .then(result =>{
            this.accountRecords = result;
            console.log('data');
        })
        .catch(error =>{
            this.accountRecords = error;
            console.log('error');
        })
    }
}