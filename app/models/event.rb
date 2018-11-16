class Event < ApplicationRecord
    
    def user
      return User.find_by(id: self.user_id)
    end


   has_many :eventpics

end
