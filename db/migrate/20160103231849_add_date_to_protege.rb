class AddDateToProtege < ActiveRecord::Migration
  def change
    add_column :proteges, :birth_date, :date
  end
end
