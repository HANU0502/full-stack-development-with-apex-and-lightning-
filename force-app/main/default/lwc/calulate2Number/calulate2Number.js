import { LightningElement,track } from 'lwc';
import geValueResult from '@salesforce/apex/CalculateNumber.getResult';
export default class Calulate2Number extends LightningElement {
    
    @track fNum;
    @track SNum;
    @track sum;
    @track error;

    handleClick(){
        geValueResult({firstNumber:this.fNum,secondNumber:this.SNum})
        .then(result=>{
            this.sum = result[0];
        })
        .catch(error=>{
            this.sum = error;
        })
    }

    handleChange(event){
        if(event.target.name==='fNum'){
            this.fNum = event.target.value;
        }
       else if(event.target.name==='SNum'){
            this.SNum = event.target.value;
        }
    }

}