class Blog < ApplicationRecord
  
  validates :user_id, {presence: true}  
    
  def user
    return User.find_by(id: self.user_id)
  end
  
  belongs_to :user
  has_many :favorites
  
  
end
