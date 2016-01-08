class AddExtraFieldToMeasureType < ActiveRecord::Migration
  def change
    add_column :measure_types, :extra_field, :boolean, default: false
  end
end
