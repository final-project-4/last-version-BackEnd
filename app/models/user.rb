class User < ApplicationRecord
    has_secure_password
    has_secure_token :auth_token
    has_many :reviews, dependent: :delete_all
end
