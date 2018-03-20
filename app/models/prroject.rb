class Prroject < ActiveRecord::Base
  belongs_to :tenant
  has_many :artifacts , dependent: :destroy
  validates_uniqueness_of :title
  has_many :user_prrojects

  has_many :users, through: :user_prrojects
    validate :free_plan_can_only_have_one_prroject
    
    def free_plan_can_only_have_one_prroject
    
        if self.new_record? && (tenant.prrojects.count > 0) && (tenant.plan == 'free')
        
        errors.add(:base, "Free plans cannot have more than one prroject")
        
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
    
    def self.by_user_plan_and_tenant(tenant_id, user)

      tenant = Tenant.find(tenant_id)
      
      if tenant.plan == 'premium'
      
      if user.is_admin?
      
      tenant.prrojects
      
      else
      
      user.prrojects.where(tenant_id: tenant.id)
      
      end
      
      else
      
      if user.is_admin?
      
      tenant.prrojects.order(:id).limit(1)
      
      else
      
      user.prrojects.where(tenant_id: tenant.id).order(:id).limit(1)
      
      end
      
      end
      
    end
end