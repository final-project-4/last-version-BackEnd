class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :delete_all
end
