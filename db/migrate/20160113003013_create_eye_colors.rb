class CreateEyeColors < ActiveRecord::Migration
  def change
    create_table :eye_colors do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
  end
end
