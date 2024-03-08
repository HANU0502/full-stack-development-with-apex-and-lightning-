import { LightningElement } from 'lwc';

export default class InterviePrep extends LightningElement {
    userName = '';
    constructor(){
        this.userName = '';
        super();
        console.log('In the pare')
   }
}