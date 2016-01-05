class Medicine < ActiveRecord::Base
  belongs_to :protege
  has_many :medicine_times
end
