require 'rails_helper'

describe "user can view a single category" do
  describe "that doesn't have any ideas in the category" do
    scenario "user clicks on a category and it shows the category" do
      category1 = Category.create!(name: 'cats', description: 'cat things')
      category2 = Category.create(name: 'fish', description: 'trout')

      visit categories_path

      click_on "cats"

      expect(current_path).to eq(category_path(category1))
      expect(page).to have_content(category1.name)
      expect(page).to have_content(category1.description)
      expect(page).to_not have_content(category2.name)
    end
  end

  describe "that has ideas" do
    it "shows the ideas for the category" do
      default_user = create(:user)
      category = create(:category)
      category.ideas.create(name: "idea1", description: "desc", user: default_user)
      idea2 = category.ideas.create(name: "idea2", description: "desc2", user: default_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit category_path(category)
      expect(page).to have_content("idea1")
      expect(page).to have_content("idea2")

      click_on "idea2"
      expect(current_path).to eq(user_idea_path(default_user, idea2))
    end
  end
end
