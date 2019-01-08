require 'rails_helper'

RSpec.describe ReviewCategory, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryBot.create(:review_category)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:order) }
  end

  describe "associations" do

  end
end
