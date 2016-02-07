#Class used to validate and control data involving DoneExcercise model
class DoneExcercise < ActiveRecord::Base
  belongs_to :training
  belongs_to :excercise_type
end
