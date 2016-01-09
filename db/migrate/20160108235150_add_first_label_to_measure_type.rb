class AddFirstLabelToMeasureType < ActiveRecord::Migration
  def change
    add_column :measure_types, :first_label, :string
  end
end
