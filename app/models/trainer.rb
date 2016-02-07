#Class used to validate and control data involving Trainer model
class Trainer < ActiveRecord::Base
  belongs_to :user
  has_many :proteges
end
