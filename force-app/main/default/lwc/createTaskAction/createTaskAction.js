import { LightningElement } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class CreateTaskAction extends LightningElement {

    isAction=true;

    handleOnClick(){
        console.log('in parent');
        //this.dispatchEvent(new CustomEvent('save'))
        this.refs.createTodo.saveTask()

    }

    closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}