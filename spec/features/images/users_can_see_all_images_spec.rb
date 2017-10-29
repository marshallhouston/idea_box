require 'rails_helper'

describe "when I visit the images index" do
  describe "As a logged in user" do
    before :each do
      @user = create(:user)
      @image1 = Image.create!(name: "other dogs", url: "https://static.pexels.com/photos/160829/puppies-black-brown-labrador-160829.jpeg")
      @image2 = Image.create!(name: "dog", url: "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg")
      @idea = @user.ideas.create(name: "pets", description: "dogs", category: create(:category))
      IdeaImage.create(idea: @idea, image: @image1)
      IdeaImage.create(idea: @idea, image: @image2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    scenario "I can see all images" do
      visit images_path

      expect(page).to have_css("img[src$='#{@image1.url}']")
      expect(page).to have_css("img[src$='#{@image2.url}']")
    end

    scenario "I can visit an image's show page from the image index" do
      visit images_path
      expect(page).to have_link(@image1.name)

      click_link(@image1.name)
      expect(current_path).to eq(image_path(@image1))
    end
  end
end
