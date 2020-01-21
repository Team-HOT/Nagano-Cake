class ProductCategory < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :product_category_name, :product_category_status, presence: true
end