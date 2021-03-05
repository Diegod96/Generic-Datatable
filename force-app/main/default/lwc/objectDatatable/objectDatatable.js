import { LightningElement, track, api, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { deleteRecord } from 'lightning/uiRecordApi';

import getObjects from '@salesforce/apex/ObjectController.getObjects';

export default class ObjectDatatable extends LightningElement {

    @api selectedObject;
    @track columns;
    @track records;
    draftValues = [];
 
    @wire(getObjects, { sourceType: '$selectedObject' })
    objectData({error, data}) {
        if(data){
            //console.log("There is data");
            this.records = data.records;
            this.columns = data.columns;
            //console.log("Columns: " + JSON.stringify(this.columns));
            //console.log("Records: " + JSON.stringify(this.records));
        }else{
            this.error = error;
            //console.log("There is no data");
            //console.log("Error: " + JSON.stringify(error));
        }
    }

    handleObjectChange(event) {
        this.selectedObject = event.detail;
        //console.log(this.selectedObject);
    }
}