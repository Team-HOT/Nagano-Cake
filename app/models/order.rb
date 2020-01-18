class Order < ApplicationRecord

	has_many :order_items
	has_many :order_items, dependent: :destroy
	belongs_to :end_user

end
