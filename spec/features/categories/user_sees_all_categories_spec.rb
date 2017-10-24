require 'rails_helper'

describe "user sees all categories" do
  before :each do
    @category1 = Category.create!(name: 'cats', description: 'cat things')
    @category2 = Category.create(name: 'fish', description: 'trout')
  end

  scenario "all categories are shown" do
    visit categories_path

    expect(page).to have_content(@category1.name)
    expect(page).to have_content(@category2.name)
  end
end
