import { LightningElement, track, api, wire } from 'lwc';
import getObjects from '@salesforce/apex/ObjectController.getObjects';

export default class ObjectDatatable extends LightningElement {

    @api selectedObject;
    @track columns;
    @track records;
 
    @wire(getObjects, { sourceType: '$selectedObject' })
    objectData({error, data}) {
        if(data){
            console.log("There is data");
            this.records = data.records;
            this.columns = data.columns;
            console.log("Columns: " + JSON.stringify(this.columns));
            console.log("Records: " + JSON.stringify(this.records));
        }else{
            this.error = error;
            console.log("There is no data");
            console.log("Error: " + JSON.stringify(error));
        }
    }
    // get columns() {
    //     return objectData && objectData.data ? objectData.data.columns : [];
    // }
    // get records() {
    //     return objectData && objectData.data ? objectData.data.records : [];
    // }

    handleObjectChange(event) {
        this.selectedObject = event.detail;
        console.log(this.selectedObject);
    }
}