#Class used to validate and control data involving MedicineTime model
class MedicineTime < ActiveRecord::Base
  belongs_to :medicine
  validates :medicine_time, presence: true
  validates_presence_of :remind_when, :if => :remind_is_true?

	def remind_is_true?
	  remind == true
	end
end
