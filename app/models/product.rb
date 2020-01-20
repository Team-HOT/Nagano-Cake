class Product < ApplicationRecord
	attachment :product_image
	has_many :cart_items
	belongs_to :product_category, required: true

	validates :name, :price, :product_body, :product_image, :sale_status, presence: true
end