public with sharing class AccountTriggerHelper {

    public static void beforeInsert(List<Account> newAccounts){

        for (Account acc : newAccounts) {
            
            //Question 1
            if(acc.Type == null){
                acc.Type = 'Prospect';
            }

            //Question 2
            if (acc.ShippingState != null && acc.BillingState == null) {
                acc.BillingState = acc.ShippingState;   
            }
             if (acc.ShippingCity != null && acc.BillingCity == null) {
                acc.BillingCity = acc.ShippingCity;   
            }
             if (acc.ShippingStreet != null && acc.BillingStreet == null) {
                acc.BillingStreet = acc.ShippingStreet;   
            }
             if (acc.ShippingPostalCode != null && acc.BillingPostalCode == null) {
                acc.BillingPostalCode = acc.ShippingPostalCode;   
            }
             if (acc.ShippingCountry != null && acc.BillingCountry == null) {
                acc.BillingCountry = acc.ShippingCountry;   
            }

            //Question 3
            if (acc.Phone != null && acc.Website != null && acc.Fax != null) {
                acc.Rating = 'Hot';
                
            }

        }

        
        
    }

    public static void afterInsert(List<Account> newAccounts){

         List<Contact> contactsToInsert = new List<Contact>();

        // Question 4 
         for (Account acc : newAccounts) {
            contactsToInsert.add(new Contact(AccountId = acc.Id ,LastName = 'DefaultContact', Email='default@email.com'));
         }
         
        Database.insert(contactsToInsert);
    }


}