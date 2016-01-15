class CreateExcerciseTypes < ActiveRecord::Migration
  def change
    create_table :excercise_types do |t|
      t.text :name
      t.string :formula

      t.timestamps null: false
    end
  end
end
