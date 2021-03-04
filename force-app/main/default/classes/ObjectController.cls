public with sharing class ObjectController {
    public class Column {
        @AuraEnabled public String fieldName;
        @AuraEnabled public String fieldLabel;
        @AuraEnabled public String fieldType;
        Column(String fName, String fLabel, String fType) {
            fieldName = fName;
            fieldLabel = fLabel;
            fieldType = fType;
        }
    }
    public class Response {
        @AuraEnabled public Column[] columns = new Column[0];
        @AuraEnabled public sObject[] records;
    }
    @AuraEnabled(cacheable=true) public static Response getObjects(String sourceType) {
        Response res = new Response();
        switch on sourceType {
            when 'Opportunity' {
                res.records = [SELECT Name, AccountId, Amount, CloseDate, toLabel(StageName), OwnerId FROM Opportunity];
                res.columns.add(new Column('Name','Name','text'));
                res.columns.add(new Column('AccountId','Account ID','text'));
                res.columns.add(new Column('Amount','Amount','currency'));
                res.columns.add(new Column('CloseDate','Close Date','date'));
                res.columns.add(new Column('StageName','Stage Name','text'));
                res.columns.add(new Column('OwnerId','Owner ID','text'));
            }

            when 'Account' {
                res.records = [SELECT Name, BillingCity, Phone, Type FROM Account];
                res.columns.add(new Column('Name', 'Name', 'text'));
                res.columns.add(new Column('BillingCity', 'Billing City', 'text'));
                res.columns.add(new Column('Phone', 'Phone', 'phone'));
                res.columns.add(new Column('Type', 'Type', 'text'));
            }

            when 'Contact' {
                res.records = [SELECT Name, AccountId, Title, Phone, Email, OwnerId FROM Contact];
                res.columns.add(new Column('Name' , 'Name', 'text'));
                res.columns.add(new Column('AccountId', 'Account ID', 'text'));
                res.columns.add(new Column('Title' , 'Title', 'text'));
                res.columns.add(new Column('Phone', 'Phone', 'phone'));
                res.columns.add(new Column('Email', 'Email', 'email'));
                res.columns.add(new Column('OwnerId', 'Owner ID','text'));
            }

            when 'Case' {
                res.records = [SELECT CaseNumber, Subject, Status, CreatedDate, OwnerId FROM Case];
                res.columns.add(new Column('CaseNumber', 'Case Number', 'text'));
                res.columns.add(new Column('Subject', 'Subject', 'text'));
                res.columns.add(new Column('Status', 'Status', 'text'));
                res.columns.add(new Column('CreatedDate', 'Created Date', 'date'));
                res.columns.add(new Column('OwnerId', 'Owner ID', 'text'));
            }

            when 'Lead' {
                res.records = [SELECT Name, Company, Address, Email, Status FROM Lead];
                res.columns.add(new Column('Name', 'Name', 'text'));
                res.columns.add(new Column('Company', 'Company', 'text'));
                res.columns.add(new Column('Address', 'Address', 'text'));
                res.columns.add(new Column('Email', 'Email', 'email'));
                res.columns.add(new Column('Status', 'Status', 'text'));
            }
        }
        return res;
    }
}







































// public with sharing class ObjectController {

//     @AuraEnabled(cacheable=true)
//     public static List <Account> getAccounts(){
//         return [
//             SELECT Name, BillingCity, Phone, Type
//             FROM Account
//         ];
//     }

//     @AuraEnabled(cacheable=true)
//     public static List <Contact> getContacts(){
//         return [
//             SELECT Name, AccountId, Title, Phone, Email, OwnerId
//             FROM Contact
//         ];
//     }

//     @AuraEnabled(cacheable=true)
//     public static List <Case> getCases(){
//         return [
//             SELECT CaseNumber, Subject, Status, CreatedDate, OwnerId
//             FROM Case
//         ];
//     }

//     @AuraEnabled(cacheable=true)
//     public static List <Lead> getLeads(){
//         return [
//             SELECT Name, Company, Address, Email, Status
//             FROM Lead
//         ];
//     }

//     @AuraEnabled(cacheable=true)
//     public static List <Opportunity> getOpportunities(){
//         return [
//             SELECT Name, AccountId, Amount, CloseDate, StageName, OwnerId
//             FROM Opportunity
//         ];
//     }
// }


