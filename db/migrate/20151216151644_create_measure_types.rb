class CreateMeasureTypes < ActiveRecord::Migration
  def change
    create_table :measure_types do |t|
      t.text :name
      t.text :unit

      t.timestamps null: false
    end
  end
end
