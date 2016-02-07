#Class used to validate and control data involving Medicine model
class Medicine < ActiveRecord::Base
  belongs_to :protege
  has_many :medicine_times, :dependent => :delete_all
end
