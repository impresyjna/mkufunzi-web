#Serializer for BloodType model, used to send data via json files
class BloodTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
end
