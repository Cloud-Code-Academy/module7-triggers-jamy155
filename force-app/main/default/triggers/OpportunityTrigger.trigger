trigger OpportunityTrigger on Opportunity (after update, before update , before delete) {

    switch on Trigger.operationType {
        when AFTER_UPDATE  {
            OpportunityTriggerHelper.afterUpdate(Trigger.new);
        }
        when BEFORE_UPDATE {
            OpportunityTriggerHelper.beforeUpdate(Trigger.new);
        }
        when BEFORE_DELETE {
            OpportunityTriggerHelper.beforeDelete(Trigger.old);
        }
    }

}