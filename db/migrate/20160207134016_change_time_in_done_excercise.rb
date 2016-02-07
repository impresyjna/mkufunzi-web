class ChangeTimeInDoneExcercise < ActiveRecord::Migration
  def change
    change_column :done_excercises, :time,  :string
  end
end
