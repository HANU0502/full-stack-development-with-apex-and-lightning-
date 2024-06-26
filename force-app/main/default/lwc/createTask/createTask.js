import { LightningElement,api } from 'lwc';

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

}