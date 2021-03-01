import {LightningElement, api} from 'lwc';

export default class ObjectCombobox extends LightningElement {

    @api selectedObjectValue;
    
    get options() {
        return [{
            
                label: "Account",
                value: 'account'
            },
            {
                label: "Contact",
                value: 'contact'
            },
            {
                label: "Case",
                value: 'case'
            },
            {
                label: "Lead",
                value: 'lead'
            },
            {
                label: "Opportunity",
                value: 'opportunity'
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