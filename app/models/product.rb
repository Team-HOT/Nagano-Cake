class Product < ApplicationRecord
	attachment :product_image
	belongs_to :product_category
end
