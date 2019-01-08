require 'rails_helper'

RSpec.describe CodeReference, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryBot.create(:code_reference)).to be_valid
    end

    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:number) }
  end

  describe "associations" do
  end
end
