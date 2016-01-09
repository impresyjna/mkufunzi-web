class AddSecondLabelToMeasureType < ActiveRecord::Migration
  def change
    add_column :measure_types, :second_label, :string
  end
end
