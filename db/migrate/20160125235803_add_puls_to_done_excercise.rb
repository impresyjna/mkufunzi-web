class AddPulsToDoneExcercise < ActiveRecord::Migration
  def change
    add_column :done_excercises, :puls, :integer
  end
end
