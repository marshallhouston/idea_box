require 'rails_helper'

describe User do
  describe "Validations" do
    it "is invalid" do
      user = User.new

      expect(user).to_not be_valid
    end

    it "is valid" do
      user = build(:user)

      expect(user).to be_valid
    end
  end

  describe "Roles" do
    it "can be created as a default user" do
      user = User.new(name: "reg", email: "reg@reg.com", password: "pass", role: 0)

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it "can be created as an admin user" do
      user = User.new(name: "admin", email: "admin@admin.com", password: "pass", role: 1)

      expect(user).to be_valid
      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created without a role passed to it" do
      user = User.new(name: "reg", email: "reg@reg.com", password: "pass")

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end

  describe "Associations" do
    it "has ideas" do
      user = build(:user)

      expect(user).to respond_to(:ideas)
    end
  end
end
