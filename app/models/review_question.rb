class ReviewQuestion < ApplicationRecord
  belongs_to :review_category

  validates_presence_of :body
  validates_presence_of :code_reference
  validates_presence_of :order
  validates_presence_of :review_category_id
end
