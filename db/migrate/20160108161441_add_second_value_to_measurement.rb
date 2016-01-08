class AddSecondValueToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :second_value, :float
  end
end
