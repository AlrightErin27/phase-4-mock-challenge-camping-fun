class DetailedCamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :activities
  has_many :activities
end
