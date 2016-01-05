class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.text :name
      t.text :dose
      t.text :dose_unit
      t.references :protege, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
