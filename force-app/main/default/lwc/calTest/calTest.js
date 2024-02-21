import { LightningElement, track } from 'lwc';

export default class CalTest extends LightningElement {
    firstNumber=0
    SecondNumber=0
    handleValue(event){
        console.log('handle');
        if(event.target.name==='fnum'){
            this.firstNumber = event.target.value;
            console.log(this.firstNumber);
        }
        if(event.target.name==='snum'){
            this.SecondNumber = event.target.value;
        }
        this.result = parseInt(this.firstNumber)+parseInt(this.SecondNumber);
    }
}