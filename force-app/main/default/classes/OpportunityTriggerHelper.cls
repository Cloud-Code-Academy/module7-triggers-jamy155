public with sharing class OpportunityTriggerHelper {
    
    public static void afterUpdate(List<Opportunity> updatedOpps ){


        //Question 5
        for (Opportunity opp : updatedOpps) {
            if (opp.Amount < 5000) {
                opp.addError('Opportunity amount must be greater than 5000');
            }
        }
    }

    public static void beforeUpdate(List<Opportunity> updatedOpps ){

        List<Id> accIds = new List<Id>();

        //Question 7
        for (Opportunity opp : updatedOpps) {
            accIds.add(opp.AccountId);
        }

        List<Contact> contacts = [SELECT Id , AccountId FROM Contact WHERE Title = 'CEO'];

        for (Opportunity opp : updatedOpps) {

            for (Contact cont : contacts) {
               
                if (cont.AccountId == opp.AccountId) {
                    opp.Primary_Contact__c = cont.Id;    
                }     
            }         
        }
    }

    public static void beforeDelete(List<Opportunity> deletedOpps){

        //Question 6
        List<Account> accounts = [SELECT Id FROM Account WHERE Industry = 'Banking'];
        List<Id> accIds = new List<Id>();

        for (Account acc : accounts) {
            accIds.add(acc.Id);
        }
         for (Opportunity opp : deletedOpps) {
            if (opp.StageName == 'Closed Won' && accIds.contains(opp.AccountId)) {
                opp.addError('Cannot delete closed opportunity for a banking account that is won');
            }
         }
    }
}