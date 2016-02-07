#Serializer for Measurement model, used to send data via json files
class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at, :measure_type_id, :card_id, :second_value
end
