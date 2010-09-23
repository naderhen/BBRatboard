class Customer < ActiveRecord::Base
  has_many :sales
  
  def self.search(query)
      where("name like ?", "%#{query}%")
  end
  
  
end
