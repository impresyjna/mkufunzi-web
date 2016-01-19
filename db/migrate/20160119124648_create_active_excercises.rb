class CreateActiveExcercises < ActiveRecord::Migration
  def change
    create_table :active_excercises do |t|
      t.integer :how_many
      t.references :excercise_type, index: true, foreign_key: true
      t.references :training, index: true, foreign_key: true
      t.datetime :time
      t.integer :puls
      t.references :protege, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
