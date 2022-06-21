class Buddy < ApplicationRecord
  belongs_to :user

  validates :name, :buddy_type, :skills, :description, :activities, :rate, presence: true
  #length of description
  #collection of types to choose from?

end
