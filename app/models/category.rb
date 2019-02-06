class Category < ApplicationRecord
    has_many :product , dependent: :delete_all
end
