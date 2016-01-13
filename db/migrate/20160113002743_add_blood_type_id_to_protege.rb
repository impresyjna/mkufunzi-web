class AddBloodTypeIdToProtege < ActiveRecord::Migration
  def change
    add_column :proteges, :blood_type_id, :integer
  end
end
