class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #不要将assign_default_role放在rolify之前,不然会被执行两次
  after_create :assign_default_role

  def super_admin?
    self.has_role? Setting.roles.super_admin
  end

  def set_roles(roles)
    self.roles = Role.where(:id => roles)
  end

  def assign_default_role
    self.add_role Setting.roles.new_buyer
  end
end
