class MeasureTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :extra_field, :first_label, :second_label
end
