class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :body, :image_url, :published_at
  has_one :author
end
