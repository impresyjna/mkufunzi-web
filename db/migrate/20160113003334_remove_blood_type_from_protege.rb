class RemoveBloodTypeFromProtege < ActiveRecord::Migration
  def change
    remove_column :proteges, :blood_type, :string
  end
end
