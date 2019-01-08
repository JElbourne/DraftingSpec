class ReviewCategory < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :order
end
