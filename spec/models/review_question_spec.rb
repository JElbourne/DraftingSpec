require 'rails_helper'

RSpec.describe ReviewQuestion, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryBot.create(:review_question)).to be_valid
    end

    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:code_reference) }
    it { should validate_presence_of(:order) }
    it { should validate_presence_of(:review_category_id) }
  end

  describe "associations" do
    it { should belong_to(:review_category) }
  end
end
