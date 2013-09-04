class CategorySerializer < ActiveModel::Serializer
  attributes :id, :parent_id, :name, :image_url, :description

  # has_many :products, embed: :id
end
