import { LightningElement } from 'lwc';

export default class ToDoManager extends LightningElement {

    refreshToDo(){
        this.refs.pendingTodo.refreshList();
        this.refs.completedTodo.refreshList();
    }
}