class Prroject < ActiveRecord::Base
  validates_uniqueness_of :title

    validate :free_plan_can_only_have_one_prroject
    
    def free_plan_can_only_have_one_prroject
    
        if self.new_record? && (tenant.prrojects.count > 0) && (tenant.plan == 'free')
        
        errors.add(:base, "Free plans cannot have more than one project")
        
        end
    
    end
    
    
    
    def self.by_plan_and_tenant(tenant_id)
    
        tenant = Tenant.find(tenant_id)
        
        if tenant.plan == 'premium'
        
        tenant.prrojects
        
        else
        
        tenant.prrojects.order(:id).limit(1)
        
        end
    end
end