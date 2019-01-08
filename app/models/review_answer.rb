class ReviewAnswer < ApplicationRecord
  belongs_to :review_question
  belongs_to :project

  validates_presence_of :complete
  validates_presence_of :review_question_id
  validates_presence_of :project_id
end
