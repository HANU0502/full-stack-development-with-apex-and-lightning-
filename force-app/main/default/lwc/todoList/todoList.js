import { LightningElement,wire,api } from 'lwc';
import getTodoList from '@salesforce/apex/TodoController.getTodoList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import updateTaskStatus from '@salesforce/apex/TodoController.updateTaskStatus';
import deleteTask from '@salesforce/apex/TodoController.deleteTask';
 
export default class TodoList extends LightningElement {

    @api taskStatus;
    todoList;

    get pageTitle(){
        return this.taskStatus+ 'Tasks';
    }

    get showButton(){
        return this.taskStatus === 'Pending'? true : false;
    }

    @wire(getTodoList, {taskStatus: '$taskStatus'})
    wiredTodoList(result){
        console.log('line 12'+JSON.stringify(result));
        this.wiredTodoListResult = result;
        if(result.data){
            this.todoList = result.data;
        }
        else if(result.error){
            this.showToast('error',result.error.body.message,'error');
        }
    }

    showToast(title,message,variant){
        const event  = new ShowToastEvent({
            title :title,
            message : message,
            variant : variant
        })
        this.dispatchEvent(event);
    }

    @api 
    refreshList(){
        console.log('refresh data');
        refreshApex(this.wiredTodoListResult);
    }

    handleClick(event){
        console.log('line 48'+event.target.dataset.recordId);
        updateTaskStatus({taskId:event.target.dataset.recordId})
        .then(result =>{
            console.log('line 51'+result);
            if(result == 'Success'){
                this.showToast('Success','Task Has Been Complete','success');
                this.dispatchEvent(new CustomEvent('refreshtodo'));
            }
        })
        .catch(error =>{

        })
    }

    handleDelete(event){
        deleteTask({taskId:event.target.dataset.recordId})
        .then(result=>{
            if(result){
                console.log('line 67'+result);
                this.showToast('Deleted',`${result} Has Been Deleted`,'success');
                this.dispatchEvent(new CustomEvent('refreshtodo'));
            }
        })
        .catch(error=>{

        })
    }

}