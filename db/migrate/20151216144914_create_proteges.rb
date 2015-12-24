class CreateProteges < ActiveRecord::Migration
  def change
    create_table :proteges do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trainer, index: true, foreign_key: true
      t.text :blood_type
      t.text :gender
      t.text :eye_color

      t.timestamps null: false
    end
  end
end
