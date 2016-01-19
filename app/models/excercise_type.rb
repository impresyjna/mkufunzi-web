class ExcerciseType < ActiveRecord::Base
	has_many :excercise, :dependent => :delete_all
	has_many :active_excercise
end
