require 'rails_helper'

describe "user can view a single category" do
  describe "that doesn't have any ideas in the category" do
    before :each do
      @category1 = Category.create!(name: 'cats', description: 'cat things')
      @category2 = Category.create(name: 'fish', description: 'trout')
    end

    scenario "user clicks on a category and it shows the category" do
      visit categories_path

      click_on "cats"

      expect(current_path).to eq(category_path(@category1))
      expect(page).to have_content(@category1.name)
      expect(page).to have_content(@category1.description)
      expect(page).to_not have_content(@category2.name)
    end
  end

  xdescribe "that has ideas" do

    before :each do
      #create a user
      #create a category with 2 ideas
      #log that user in
    end

    it "shows the ideas for the category" do
      #
    end
  end
end
