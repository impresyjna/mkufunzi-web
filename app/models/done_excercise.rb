class DoneExcercise < ActiveRecord::Base
  belongs_to :training
  belongs_to :excercise_type
end