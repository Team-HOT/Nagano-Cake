class Product < ApplicationRecord
	attachment :product_image
	has_many :cart_items
	belongs_to :product_category
end
