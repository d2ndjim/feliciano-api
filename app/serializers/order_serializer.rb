class OrderSerializer < ActiveModel::Serializer
  attributes :id
  has_one :menu
  has_one :user
end
