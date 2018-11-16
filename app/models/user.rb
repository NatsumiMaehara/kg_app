class User < ApplicationRecord
     
   has_secure_password
   
     validates :nickname,{presence: true}
     validates :email,{presence: true,uniqueness: true}
     validates :password,{presence: true}
     
     has_many :friends, dependent: :destroy
     has_many :favorites, dependent: :destroy

end
