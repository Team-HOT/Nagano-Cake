class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

acts_as_paranoid

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :history
  accepts_nested_attributes_for :deliveries
end
