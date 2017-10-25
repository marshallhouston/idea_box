require 'rails_helper'

describe "When I visit admin edit image page" do
  describe "as an admin" do
    scenario "I can edit the image" do
      image = Image.create!(name: "dog", url: "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg")
      new_url = "https://static.pexels.com/photos/160829/puppies-black-brown-labrador-160829.jpeg"
      admin_user = User.create!(name: "admin",
                                email: "admin@admin",
                                password: "admin",
                                role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit edit_admin_image_path(image)

      expect(page).to have_content("dog")
      expect(page).to have_content(image.url)

      fill_in "image[name]", with: "pets"
      fill_in "image[url]", with: "https://static.pexels.com/photos/160829/puppies-black-brown-labrador-160829.jpeg"

      click_on "Update Image"

      expect(current_path).to eq(admin_image_path(image))
      expect(page).to have_content("pets")
      expect(page).to_not have_content("dog")
      expect(page).to have_css("img[src$='#{new_url}']")
    end
  end
end
