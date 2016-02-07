#Class used to validate and control data involving MeasureType model
class MeasureType < ActiveRecord::Base
	has_many :measurement, :dependent => :delete_all

	before_save { name[0].capitalize }
	validates :name, presence: true, uniqueness: { case_sensitive: false }

end
