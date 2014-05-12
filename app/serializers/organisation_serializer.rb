class OrganisationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url
  has_one :creator
end
