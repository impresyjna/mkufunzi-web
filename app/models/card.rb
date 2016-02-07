#Class used to validate and control data involving Card model
class Card < ActiveRecord::Base
	belongs_to :protege
	has_many :measurements
end
