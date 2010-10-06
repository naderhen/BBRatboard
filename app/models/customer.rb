class Customer < ActiveRecord::Base
  has_many :sales
  
  validates_presence_of :name, :message => "can't be blank"
  
  def self.search(query)
      where("name like ?", "%#{query}%")
  end
  
  
end
