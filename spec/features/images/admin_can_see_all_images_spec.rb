require 'rails_helper'

describe "When I visit admin images index" do
  describe "as an admin" do
    scenario "I see all images" do
      image1 = create(:image)
      image2 = Image.create!(name: "dog", url: "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg")
      admin_user = User.create!(name: "admin",
                                email: "admin@admin",
                                password: "admin",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit admin_images_path

      expect(page).to have_content(image1.name)
      expect(page).to have_css("img[src$='#{image1.url}']")
      expect(page).to have_content(image2.name)
      expect(page).to have_css("img[src$='#{image2.url}']")
    end
  end

  describe "as a default user" do
    scenario "I see a 404 error" do
      default_user = User.create!(name: "default",
                                  email: "def@def.com",
                                  password: "pass")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit admin_images_path

      expect(status_code).to eq(404)
    end
  end
end
