require 'rails_helper'

describe "user can view a single category" do
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
