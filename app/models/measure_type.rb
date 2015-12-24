class MeasureType < ActiveRecord::Base
	belongs_to :measurement
	has_one :measure_type
end
