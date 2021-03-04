import {LightningElement, api} from 'lwc';

export default class ObjectCombobox extends LightningElement {

    @api selectedObjectValue;
    
    get options() {
        return [{
            
                label: "Account",
                value: 'Account'
            },
            {
                label: "Contact",
                value: 'Contact'
            },
            {
                label: "Case",
                value: 'Case'
            },
            {
                label: "Lead",
                value: 'Lead'
            },
            {
                label: "Opportunity",
                value: 'Opportunity'
            },
        ];
    }

    handleChange(event) {
        this.selectedObjectValue = event.target.value;
        //console.log("Selcted value: " + this.selectedObjectValue);
        const selectedEvent = new CustomEvent("objectvaluechange", {
            detail: this.selectedObjectValue
        });
        this.dispatchEvent(selectedEvent);
    }
}