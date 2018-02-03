class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :clients, through: :orders
end
