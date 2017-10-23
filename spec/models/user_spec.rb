require 'rails_helper'

describe User do
  describe "validations" do
    it "is invalid" do
      user = User.new

      expect(user).to_not be_valid
    end

    it "is valid" do
      user = build(:user)

      expect(user).to be_valid
    end
  end

  describe "relationships" do
    it "has ideas" do
      user = build(:user)

      expect(user).to respond_to(:ideas)
    end
  end
end
