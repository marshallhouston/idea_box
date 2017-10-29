require 'rails_helper'

describe Category do
  describe "Validations" do
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

  describe "Associations" do
    it "has many ideas" do
      category = build(:category)

      expect(category).to respond_to(:ideas)
    end
  end

  # describe "Instance Methods" do
  #   it "#category_ideas_specific_user" do
  #
  #     # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
  #   end
  # end
end
