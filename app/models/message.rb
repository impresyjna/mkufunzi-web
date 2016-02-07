#Class used to validate and control data involving Message model
class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :user

  validates :content, presence: true, length: { maximum: 50 }
end
