require 'rails_helper'

describe "When I visit admin new category" do
  describe "as an admin" do
    scenario "I see a new form, fill it in, and click create" do
      admin_user = User.create!(name: "admin",
                                email: "admin@admin.com",
                                password: "pass",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit new_admin_category_path

      expect(page).to have_content("Create A New Category")

      fill_in "category[name]", with: "cats"
      fill_in "category[description]", with: "ideas about cats"

      click_on "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("cats")
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
