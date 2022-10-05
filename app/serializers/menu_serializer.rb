class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :price, :description, :image
end
