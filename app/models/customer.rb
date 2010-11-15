class Customer < ActiveRecord::Base
  has_many :sales
  has_many :attachments
  
  validates_presence_of :name, :message => "can't be blank"
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  def self.per_page
    10
  end
  
  
end
