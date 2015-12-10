class CardIndex < ActiveRecord::Base
	has_many :cards
	has_many :users, :through => :cards 
end
