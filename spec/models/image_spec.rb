require 'rails_helper'

describe Image do
  describe "validations" do
    context "invalid"
    it "is invalid without a name" do
      image = Image.new(url: "https://unsplash.com/photos/b_8eErngWm4")

      expect(image).to_not be_valid
    end

    it "is invalid without a description" do
      image = Image.new(name: "image_1")

      expect(image).to_not be_valid
    end

    context "valid"
    it "is valid with a name and url" do
      image = create(:image)

      expect(image).to be_valid
    end
  end
end
