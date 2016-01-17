class Training < ActiveRecord::Base
  belongs_to :protege
  has_many :excercise
  has_many :done_excercise
end
