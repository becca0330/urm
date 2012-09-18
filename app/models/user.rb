# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  email               :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  name                :string(255)     default(""), not null
#  created_at          :datetime
#  updated_at          :datetime
#  status              :string(255)
#

class User < ActiveRecord::Base
   acts_as_authentic
   has_many :user_roles 
   has_many :projects
   has_many :roles, :through => :projects
   
  def role_to_project=(role, project)
    self.roles_mask = (roles )
  end
      
  def has_role?(role_sym) 
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
  
  def add_role(role) 
    return if self.has_role?(role) 
    self.roles << Role.find_by_name(role) 
  end 

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

