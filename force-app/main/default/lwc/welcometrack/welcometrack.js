import { LightningElement, track } from 'lwc';

export default class Welcometrack extends LightningElement {
    greeting;
    handleGreet(event){
        this.greeting = event.target.value;
        console.log(this.greeting);
    }
}