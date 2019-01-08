require 'rails_helper'

RSpec.describe ReviewAnswer, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryBot.create(:review_answer)).to be_valid
    end

    it { should validate_presence_of(:complete) }
    it { should validate_presence_of(:review_question_id) }
    it { should validate_presence_of(:project_id) }
  end

  describe "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:review_question) }
  end
end
