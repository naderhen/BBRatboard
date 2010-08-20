class Sale < ActiveRecord::Base
    belongs_to :ratgrade
    belongs_to :user
    belongs_to :customer
    belongs_to :warehouse
    

end
