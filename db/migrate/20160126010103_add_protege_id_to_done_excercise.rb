class AddProtegeIdToDoneExcercise < ActiveRecord::Migration
  def change
    add_column :done_excercises, :protege_id, :integer
  end
end
