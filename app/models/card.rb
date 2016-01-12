class Card < ActiveRecord::Base
	belongs_to :protege
	has_many :measurements
end
