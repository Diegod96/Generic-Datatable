import { LightningElement } from 'lwc';

export default class ObjectCombobox extends LightningElement {

    value = 'Account'

    get options() {
        return [
            {label: "Account", value: 'account'},
            {label: "Contact", value: 'contact'},
            {label: "Case", value: 'case'},
            {label: "Lead", value: 'lead'},
            {label: "Opportunity", value: 'opportunity'},
        ];
    }

    handleChange(event) {
        this.value = event.target.value;
        console.log("Selcted value: " + this.value);
    }
}