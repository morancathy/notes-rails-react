class User < ApplicationRecord
    has_secure_password   #this is a functin, dont need (). This comes from bcrypt library
end
