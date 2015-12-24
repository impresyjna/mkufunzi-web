class Measurement < ActiveRecord::Base
  belongs_to :measure_type
  belongs_to :card
end
