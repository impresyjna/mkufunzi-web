class Training < ActiveRecord::Base
  belongs_to :protege
  has_many :excercises
  has_many :done_excercises
end
