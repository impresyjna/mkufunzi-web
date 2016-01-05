class Protege < ActiveRecord::Base
  belongs_to :user
  belongs_to :trainer
  has_one :card
  has_many :medicines


  def full_name
    "#{first} #{second}"
  end
end
