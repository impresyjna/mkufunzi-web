class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.float :measurement
      t.references :card_index, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :cards, [:card_index_id, :user_id, :created_at]
  end
end
