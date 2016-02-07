#Class used to validate and control data involving EyeColor model
class EyeColor < ActiveRecord::Base
	has_one :protege
end
