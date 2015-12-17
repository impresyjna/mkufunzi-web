class RemoveCardIndexIdFromCards < ActiveRecord::Migration
  def change
    remove_reference :cards, :card_index, index: true, foreign_key: true
  end
end
