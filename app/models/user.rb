class User < ActiveRecord::Base
   has_many :user_roles 
   has_many :roles, :through => :user_roles 
      
  def has_role?(role) 
    self.roles.count(:conditions => ['name = ?', role]) > 0
  end
  
  def add_role(role) 
    return if self.has_role?(role) 
    self.roles << Role.find_by_name(role) 
  end 
  
    acts_as_authentic do |c|
    end # block optional
    
    # 2012-03-22: include the state machine for
    # email confirmation on registration
    include AASM
   
   attr_protected :status
   
   aasm_column :status
   aasm_initial_state :pending
   
   aasm_state :pending
   aasm_state :confirmed
   
   aasm_event :confirm do
      transitions :to => :confirmed, :from => :pending
   end 
end
