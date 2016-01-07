class MeasureType < ActiveRecord::Base
	has_many :measurement, :dependent => :delete_all
	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
