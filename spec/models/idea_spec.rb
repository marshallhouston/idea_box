require 'rails_helper'

describe Idea do
  describe "validations" do
    before :each do
      @user = build(:user)
    end

    it "is invalid without a name" do
      idea = Idea.new(description: "yah", user: @user)

      expect(idea).to_not be_valid
    end

    it "is invalid without a description" do
      idea = Idea.new(name: "yah", user: @user)

      expect(idea).to_not be_valid
    end

    it "is invalid without a user" do
      idea = Idea.new(name: "yah", description: "yah")

      expect(idea).to be_invalid
    end

    it "is valid with name, description, and user" do
      idea = build(:idea)

      expect(idea).to be_valid
    end
  end

  describe "relationships" do
    it "belongs to a user" do
      idea = build(:idea)

      expect(idea).to respond_to(:user)
    end

    it "belongs to a category" do
      idea = build(:idea)

      expect(idea).to respond_to(:category)
    end
  end
end
