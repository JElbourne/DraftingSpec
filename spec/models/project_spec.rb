require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryBot.create(:project)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:filenumber) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:review_answers) }
  end
end
