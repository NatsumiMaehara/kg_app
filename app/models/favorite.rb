class Favorite < ApplicationRecord
    validates :user_id,{presence: true}
    # validetes :blog_id,{presence: true}
    
      belongs_to :user
      belongs_to :blog
end
