class Menu < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :admin, class_name: 'User'

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
