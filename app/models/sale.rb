class Sale < ActiveRecord::Base
    belongs_to :ratgrade
    belongs_to :user
    belongs_to :customer
    belongs_to :warehouse
    belongs_to :board
    
    after_create :push_create
    validates_presence_of :ratgrade, :on => :create, :message => "can't be blank"
    validates_presence_of :amount, :on => :create, :message => "can't be blank"
    validates_presence_of :user, :on => :create, :message => "can't be blank"
    validates_presence_of :customer, :on => :create, :message => "can't be blank"
    validates_presence_of :warehouse, :on => :create, :message => "can't be blank"
    validates_presence_of :board, :on => :create, :message => "can't be blank"


    protected

    def push_create
    	push_event('create')
    end



    def push_event(event_type)
    Pusher["BBRatboard-#{Rails.env}"].trigger(event_type, 
                                   {:amount => self.amount, 
                                    :user_id => self.user.id})
    end

end
