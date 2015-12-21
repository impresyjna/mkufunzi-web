class Trainer < ActiveRecord::Base
  belongs_to :user
  has_many :proteges
end
