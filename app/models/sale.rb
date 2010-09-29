class Sale < ActiveRecord::Base
    belongs_to :ratgrade
    belongs_to :user
    belongs_to :customer
    belongs_to :warehouse
    belongs_to :board
    
    
    validates_presence_of :ratgrade, :on => :create, :message => "can't be blank"
    validates_presence_of :amount, :on => :create, :message => "can't be blank"
    validates_presence_of :user, :on => :create, :message => "can't be blank"
    validates_presence_of :customer, :on => :create, :message => "can't be blank"
    validates_presence_of :warehouse, :on => :create, :message => "can't be blank"
    validates_presence_of :board, :on => :create, :message => "can't be blank"

end
