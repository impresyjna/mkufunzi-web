class ChangeTimeInActiveExcercise < ActiveRecord::Migration
  def change
    change_column :active_excercises, :time,  :string
  end
end
