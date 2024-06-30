import { LightningElement,api } from 'lwc';
import saveTodo from '@salesforce/apex/TodoController.saveTodo';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateTask extends LightningElement {
    @api targetParent;
    taskTitle;
    dueDate;
    showDueDate = false;
    showSaveButton = false;

    connectedCallback(){
        console.log('line 11 clicked on parent '+this.targetParent );
    }

    handleOnChange(event){
        const fieldName = event.target.name;
        console.log('line 10'+fieldName);
        switch(fieldName){
            case 'dueDate':
                this.dueDate = event.target.value;
                this.dueDate != '' && this.targetParent != true ? this.showSaveButton = true: this.showSaveButton = false;
                break;
            case 'taskTitle':
                this.taskTitle = event.target.value;
                if(this.taskTitle != ''){
                    this.showDueDate = true;
                }
                console.log('taskTitle', this.taskTitle)
                break;
        }
    }

    @api
    saveTask(){
        console.log('#### Button clicked on child');
        saveTodo({title :this.taskTitle,dueDate : this.dueDate})
        .then(data =>{
            if(data){
                console.log('result data'+JSON.stringify(data))
                this.taskTitle = '';
                this.dueDate = '';
                this.showToast('Succees','Todo Has Been Created','success');
            }
                
        })
        .catch(error =>{
            console.log('line 40'+error);
        })
    }

    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title:title,
            message:message,
            variant:variant
        });
        this.dispatchEvent(event);
    }

}