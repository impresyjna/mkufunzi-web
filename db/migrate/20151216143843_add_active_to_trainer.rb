class AddActiveToTrainer < ActiveRecord::Migration
  def change
    add_column :trainers, :active, :boolean
  end
end
