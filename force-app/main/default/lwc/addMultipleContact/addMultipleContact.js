import { LightningElement, track } from 'lwc';

export default class AddMultipleContact extends LightningElement {

    @track contacts  = [];

    handleAdd(event){
        console.log('line 8');
        this.contacts.push({
            tempId:Date.now()
        })
        console.log(this.contacts);
    }

    connectedCallback(){
        console.log('line 14');
        this.handleAdd();
    }

    handleDelete(event){
        const tempId = event.target.dataSet
    }

}