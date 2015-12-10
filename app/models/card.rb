class Card < ActiveRecord::Base
  belongs_to :card_index
  belongs_to :user
end
