class AddProtegeIdToCard < ActiveRecord::Migration
  def change
    add_reference :cards, :protege, index: true, foreign_key: true
  end
end
