class AddEyeColorIdToProtege < ActiveRecord::Migration
  def change
    add_column :proteges, :eye_color_id, :integer
  end
end
