class FabSpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :blurb, :description, :lat, :lng

end
