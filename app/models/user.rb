class User < ApplicationRecord
    has_secure_password
    has_secure_token :auth_token
    # has_many :reviews, dependent: :delete_all

    before_validation :downcase_email

    validates :name, :email, :password, presence: true 
    validates :email, uniqueness: true 
    validates :password, length: { minimum: 2 }
  
    def downcase_email 
      self.email = email.downcase if self.email.present?
    end
end
