class Order < ApplicationRecord
  belongs_to :menu
  belongs_to :user

  validates :menu_id, presence: true
  validates :user_id, presence: true
end
