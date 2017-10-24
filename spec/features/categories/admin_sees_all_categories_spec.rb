require 'rails_helper'

describe "When I visit admin categories index" do
  describe "as an admin" do
    scenario "I can see all new categories" do
      category1 = Category.create!(name: "cats", description: "cats1")
      category2 = Category.create!(name: "dogs", description: "dogs1")

      admin_user = User.create!(name: "admin",
                                email: "admin@admin.com",
                                password: "pass",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit admin_categories_path

      expect(page).to have_content(category1.name)
      expect(page).to have_content(category2.name)
    end
  end

  describe "as a default user" do
    scenario "I see a 404 error" do
      default_user = User.create!(name: "default",
                                  email: "def@def.com",
                                  password: "pass")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit new_admin_category_path

      expect(status_code).to eq(404)
    end
  end

end
