class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :clients, through: :orders

  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

end
