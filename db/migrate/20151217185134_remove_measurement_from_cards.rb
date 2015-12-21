class RemoveMeasurementFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :measurement, :float
  end
end
