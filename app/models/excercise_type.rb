class ExcerciseType < ActiveRecord::Base
	has_many :excercise, :dependent => :delete_all
end
