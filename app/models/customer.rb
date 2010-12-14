class Customer < ActiveRecord::Base
  has_many :sales
  has_many :attachments
  has_many :calls
  validates_presence_of :name, :message => "can't be blank"
  
  scope :bad_customers, where('client_type = ?', 'Prospect')
  
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
