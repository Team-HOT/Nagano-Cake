class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :end_user
	scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
end
