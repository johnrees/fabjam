class FabSpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :description, :lat, :lng
end
