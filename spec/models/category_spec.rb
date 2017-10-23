require 'rails_helper'

describe Category do
  describe "validations" do
    it "is invalid without a name" do
      category = Category.new(description: "some description")

      expect(category).to_not be_valid
    end

    it "is invalid without a description" do
      category = Category.new(name: "habits")

      expect(category).to_not be_valid
    end

    it "is invalid without a unique name" do
      category1 = Category.create!(name: "habits", description: "something")
      category2 = Category.new(name: "habits", description: "something else")

      expect(category1).to be_valid
      expect(category2).to_not be_valid
    end

    it "is valid with a name and description" do
      category = build(:category)

      expect(category).to be_valid
    end
  end

  describe "relationships" do
    it "has ideas" do
      category = build(:category)

      expect(category).to respond_to(:ideas)
    end
  end
end
