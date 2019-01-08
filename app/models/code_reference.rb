class CodeReference < ApplicationRecord
    validates_presence_of :number
    validates_presence_of :body
end
