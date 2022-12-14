class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy
  has_many :menus, foreign_key: :admin_id, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true
end
