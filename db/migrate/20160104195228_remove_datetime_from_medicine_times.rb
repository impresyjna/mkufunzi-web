class RemoveDatetimeFromMedicineTimes < ActiveRecord::Migration
  def change
  	remove_column :medicine_times, :datetime , :string
  end
end
