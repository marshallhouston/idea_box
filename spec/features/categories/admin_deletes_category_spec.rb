require 'rails_helper'

describe "When I try to delete a category" do
  describe "as an admin" do
    scenario "I can delete the category" do
      Category.create!(name: "cats", description: "cats1")
      category2 = Category.create!(name: "dogs", description: "dogs1")
      admin_user = User.create!(name: "admin",
                                email: "admin@admin.com",
                                password: "pass",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit admin_categories_path

      within ".categories" do
        click_link("Delete this category", :match => :first)
      end

      expect(current_path).to eq(admin_categories_path)

      expect(page).to have_content(category2.name)
      expect(page).to_not have_content("cats")
    end
  end

  describe "as a default user" do
    scenario "I see a 404 error" do
      default_user = User.create!(name: "default",
                                  email: "def@def.com",
                                  password: "pass")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit admin_categories_path

      expect(status_code).to eq(404)
    end
  end

end
