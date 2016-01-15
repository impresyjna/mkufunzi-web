class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.references :protege, index: true, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.text :comment

      t.timestamps null: false
    end
  end
end
