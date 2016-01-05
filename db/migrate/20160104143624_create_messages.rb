class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_send_id, :references => "user", index: true, foreign_key: true
      t.integer :user_receive_id, :references => "user", index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
