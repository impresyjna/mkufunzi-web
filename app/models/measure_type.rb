class MeasureType < ActiveRecord::Base
	belongs_to :measurement
	has_one :measure_type

	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
