class User < ActiveRecord::Base
  acts_as_authentic
  has_many :assignments
  has_and_belongs_to_many :reports
  has_many :roles, :through => :assignments
  
  validates_presence_of :full_name, :on => :create, :message => "can't be blank"

  
  def role_symbols
      roles.map do |role|
        role.name.underscore.to_sym
      end
  end
end
