class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_secure_password   #this is a functin, dont need (). This comes from bcrypt library
end
