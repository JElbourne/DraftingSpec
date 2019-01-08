class Project < ApplicationRecord
  belongs_to :user
  has_many :review_answers

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :filenumber
  validates_presence_of :user_id

end
