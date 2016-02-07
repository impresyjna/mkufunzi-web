#Class used to validate and control data involving Excercise model
class Excercise < ActiveRecord::Base
  belongs_to :training
  belongs_to :excercise_type
end
