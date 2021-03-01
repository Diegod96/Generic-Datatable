import { LightningElement, track, api, wire } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getAccounts from '@salesforce/apex/ObjectController.getAccounts';
import getCases from '@salesforce/apex/ObjectController.getCases';
import getContacts from '@salesforce/apex/ObjectController.getContacts';
import getLeads from '@salesforce/apex/ObjectController.getLeads';
import getOpportunities from '@salesforce/apex/ObjectController.getOpportunities';



export default class ObjectDatatable extends LightningElement {


    @track selectedObject;
    @track records;
    @track columns;

    handleObjectChange(event) {
        this.selectedObject = event.detail;
        console.log(this.selectedObject);
    }

    

}