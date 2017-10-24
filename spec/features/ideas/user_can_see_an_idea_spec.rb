require 'rails_helper'

describe "user can visit a single idea page" do

  before :each do
    @user = create(:user)
    @idea1 = Idea.create!(name: "idea1", description: "read", user: @user, category: build(:category))
    @idea2 = Idea.create!(name: "idea2", description: "learn", user: @user, category: build(:category))
    visit root_path
    click_on 'Log In'
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_on 'Log In'
  end

  it "user can click on a single idea see the idea show page" do
    visit user_ideas_path(@user)

    click_on "idea1"

    expect(current_path).to eq(user_idea_path(@idea1.user, @idea1))
    expect(page).to have_content(@idea1.name)
    expect(page).to have_content(@idea1.description)
    expect(page).to_not have_content(@idea2.name)
    expect(page).to_not have_content(@idea2.description)
  end
end
