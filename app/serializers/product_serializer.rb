class ProductSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :sub_category_id, :title, :code, :image_url, :price_us, :description, :how_to_use, :ingredients, :tags
end
