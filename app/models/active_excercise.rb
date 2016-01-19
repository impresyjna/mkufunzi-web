class ActiveExcercise < ActiveRecord::Base
  belongs_to :excercise_type
  belongs_to :training
  belongs_to :protege
end
