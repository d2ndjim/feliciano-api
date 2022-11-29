class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :price, :description, :image, :created_at
end
