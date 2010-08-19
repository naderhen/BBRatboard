class Report < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :categories, :dependent => :destroy
  
  accepts_nested_attributes_for :categories, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true  
  
  
  
  
  def random_hash
    SecureRandom.hex(10)
  end

end
