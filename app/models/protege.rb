class Protege < ActiveRecord::Base
  belongs_to :user
  belongs_to :trainer
  has_one :card
end
