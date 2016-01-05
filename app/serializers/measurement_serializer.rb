class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at, :measure_type_id, :card_id
end
