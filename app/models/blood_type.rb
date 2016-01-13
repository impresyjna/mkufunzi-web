class BloodType < ActiveRecord::Base
	has_one :protege
  	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
