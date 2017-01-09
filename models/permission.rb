class Permission < ActiveRecord::Base
  has_many :role_permissionships, :dependent => :destroy
  has_many :roles, :through => :role_permissionships
end
