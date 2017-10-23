require 'rails_helper'

describe "user sees a list of ideas" do
  before :each do
    #i'd like to be able to have multiple diferent ideas created from a factory
    @user = create(:user)
    @idea1 = Idea.create!(name: "idea1", description: "read", user: @user, category: build(:category))
    @idea2 = Idea.create!(name: "idea2", description: "learn", user: @user, category: build(:category))
  end

  scenario "user has multiple ideas on a page" do
    visit user_ideas_path(@user)

    expect(page).to have_content(@idea1.name)
    expect(page).to have_content(@idea1.description)
    expect(page).to have_content(@idea2.name)
    expect(page).to have_content(@idea2.description)
  end
end
