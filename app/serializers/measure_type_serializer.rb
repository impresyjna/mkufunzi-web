#Serializer for MeasureType model, used to send data via json files
class MeasureTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :extra_field, :first_label, :second_label
end
