class Board < ActiveRecord::Base
  has_many :warehouses, :dependent => :destroy
  has_many :ratgrades, :through=>:warehouses
  has_many :sales
  accepts_nested_attributes_for :warehouses, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  
  
  scope :for_today , where("board_date = ?", Date.today)



  validates_uniqueness_of :board_date, :on => :create, :message => "There is already a Board created for this day"


end
