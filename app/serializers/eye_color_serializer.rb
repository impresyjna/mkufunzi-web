#Serializer for EyeColor model, used to send data via json files
class EyeColorSerializer < ActiveModel::Serializer
  attributes :id, :name, :color
end
