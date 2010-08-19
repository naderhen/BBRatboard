class Ratgrade < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :board
  has_many :sales
  
  
  def availableamt
    self.total-self.sales.sum('amount')
  end
  
  
  
  
  def sold
    self.sales.sum('amount')
  end
end
