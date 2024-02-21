import { LightningElement,api } from 'lwc';

export default class dispatchParent extends LightningElement {

    @api currentVal;
    handleChange(event){
        this.currentVal  = event.detail;
    }

}