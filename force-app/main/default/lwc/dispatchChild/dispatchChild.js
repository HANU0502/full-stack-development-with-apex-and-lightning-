import { LightningElement,api } from 'lwc';

export default class dispatchChild extends LightningElement {

    @api nameInput;

    handleChangeAction(event){
        this.nameInput = event.target.value;
        const mydemoEvent = new CustomEvent('demoevent',{
            detail : this.nameInput
        })
        this.dispatchEvent(mydemoEvent)
    }

}