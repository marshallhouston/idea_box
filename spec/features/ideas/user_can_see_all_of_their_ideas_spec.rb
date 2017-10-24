require 'rails_helper'

describe "user sees a list of ideas" do
  before :each do
    #i'd like to be able to have multiple diferent ideas created from a factory
    @user = create(:user)
    @idea1 = Idea.create!(name: "idea1", description: "read", user: @user, category: build(:category))
    @idea2 = Idea.create!(name: "idea2", description: "learn", user: @user, category: build(:category))
    visit root_path
    click_on 'Log In'
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_on 'Log In'
  end

  scenario "user has multiple ideas on a page" do
    visit user_ideas_path(@user)

    expect(page).to have_content(@idea1.name)
    expect(page).to have_content(@idea1.description)
    expect(page).to have_content(@idea2.name)
    expect(page).to have_content(@idea2.description)
  end
end
