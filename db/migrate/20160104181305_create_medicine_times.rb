class CreateMedicineTimes < ActiveRecord::Migration
  def change
    create_table :medicine_times do |t|
      t.datetime :medicine_time
      t.string :datetime
      t.boolean :remind
      t.datetime :remind_when
      t.references :medicine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
