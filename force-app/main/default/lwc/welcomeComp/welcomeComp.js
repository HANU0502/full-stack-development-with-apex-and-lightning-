import { LightningElement } from 'lwc';

export default class WelcomeComp extends LightningElement {


    handleRecordSelected(event){
        console.log('Selected Record Value '+event.detail.recordId);
    }
    welcomemsg = 'Welcome to lightning web component hello';
}