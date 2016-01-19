class Protege < ActiveRecord::Base
  belongs_to :user
  belongs_to :trainer
  has_one :card
  has_many :medicines
  has_many :training
  has_many :active_excercise
  belongs_to :eye_color
  belongs_to :blood_type


  def full_name
    "#{first} #{second}"
  end
end
