require 'rails_helper'

describe "When I visit new image page" do
  describe "as an admin" do
    scenario "I can create a new image" do
      admin_user = User.create!(name: "admin",
                                email: "admin@admin",
                                password: "admin",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit new_admin_image_path

      fill_in "image[name]", with: "pets"
      fill_in "image[url]", with: "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg"

      click_on "Create Image"

      expect(current_path).to eq(admin_images_path)
      expect(page).to have_content("pets")
    end
  end

  describe "as a default user" do
    scenario "I see a 404 error" do
      default_user = User.create!(name: "default",
                                  email: "def@def.org",
                                  password: "def")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit new_admin_image_path

      expect(status_code).to eq(404)
    end
  end
end
