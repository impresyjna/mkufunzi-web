class CreateDoneExcercises < ActiveRecord::Migration
  def change
    create_table :done_excercises do |t|
      t.integer :how_many
      t.datetime :time
      t.datetime :start
      t.datetime :stop
      t.references :training, index: true, foreign_key: true
      t.references :excercise_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
