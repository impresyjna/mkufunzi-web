class RemoveEyeColorFromProtege < ActiveRecord::Migration
  def change
    remove_column :proteges, :eye_color, :string
  end
end
