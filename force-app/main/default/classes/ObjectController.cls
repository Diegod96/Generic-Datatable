public with sharing class ObjectController {

    @AuraEnabled(cacheable=true)
    public static List <Accounts> getAccounts(){
        return [
            SELECT Name, BillingCity, Phone, Type
            FROM Account
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List <Contacts> getContacts(){
        return [
            SELECT Name, AccountId, Title, Phone, Email, OwnerId
            FROM Contact
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List <Case> getCases(){
        return [
            SELECT CaseNumber, Subject, Status, CreatedDate, OwnerId
            FROM Case
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List <Leads> getLeads(){
        return [
            SELECT Name, Company, Address, Email, Status
            FROM Lead
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List <Opportunities> getOpportunities(){
        return [
            SELECT Name, AccountId, Amount, CloseDate, StageName, OwnerId
            FROM Opportunity
        ];
    }
}


