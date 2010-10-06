class Ratgrade < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :board
  has_many :sales
  
  validates_presence_of :warehouse_id, :message => "can't be blank"
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :total, :message => "can't be blank"
  
  
  def availableamt
    self.total-self.sales.sum('amount')
  end
  
  
  
  
  def sold
    self.sales.sum('amount')
  end
end
