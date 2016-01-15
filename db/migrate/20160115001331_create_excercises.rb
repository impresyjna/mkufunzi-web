class CreateExcercises < ActiveRecord::Migration
  def change
    create_table :excercises do |t|
      t.integer :how_many
      t.datetime :time
      t.references :training, index: true, foreign_key: true
      t.references :excercise_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
