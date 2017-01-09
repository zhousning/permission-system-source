class Role < ActiveRecord::Base
  has_many :role_permissionships, :dependent => :destroy
  has_many :permissions, :through => :role_permissionships
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true
             #:optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  
  def set_permissions(permissions)
    if permissions 
      self.permissions = Permission.where(:id => permissions)
    end
  end
end