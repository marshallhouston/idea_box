require 'rails_helper'

describe "When I visit an image show page" do
  describe "As a logged in user" do
    scenario "I see the image and any associated ideas" do
      user = create(:user)
      image1 = Image.create!(name: "other dogs", url: "https://static.pexels.com/photos/160829/puppies-black-brown-labrador-160829.jpeg")
      image2 = Image.create!(name: "dog", url: "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg")
      idea = user.ideas.create(name: "pets", description: "dogs", category: create(:category))
      IdeaImage.create(idea: idea, image: image1)
      IdeaImage.create(idea: idea, image: image2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit image_path(image1)
      expect(page).to have_css("img[src$='#{image1.url}']")
      expect(page).to_not have_css("img[src$='#{image2.url}']")

      expect(page).to have_link(idea.name)

      click_link(idea.name)

      expect(current_path).to eq(user_idea_path(user, idea))
    end
  end
end
