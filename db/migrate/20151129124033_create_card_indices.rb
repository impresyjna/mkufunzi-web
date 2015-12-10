class CreateCardIndices < ActiveRecord::Migration
  def change
    create_table :card_indices do |t|
      t.text :name
      t.text :unit

      t.timestamps null: false
    end
  end
end
