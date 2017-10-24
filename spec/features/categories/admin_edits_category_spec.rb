require 'rails_helper'

describe "When I visit admin edit category" do
  describe "as an admin" do
    scenario "I can edit the category" do
      category1 = Category.create!(name: "cats", description: "cats1")
      admin_user = User.create!(name: "admin",
                                email: "admin@admin.com",
                                password: "pass",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit edit_admin_category_path(category1)

      fill_in "category[name]", with: "sports"
      fill_in "category[description]", with: "sports ball ideas"

      click_on "Update Category"

      expect(current_path).to eq(admin_category_path(category1))
      expect(page).to have_content("sports")
      expect(page).to have_content("sports ball ideas")
      expect(page).to_not have_content("cats")
      expect(page).to_not have_content("cats1")
    end
  end
end
