require 'rails_helper'

describe "user sees a list of ideas" do
  scenario "user has multiple ideas on a page" do
    #i'd like to be able to have multiple diferent ideas created from a factory
    user = create(:user)
    idea1 = Idea.create!(name: "idea1", description: "read", user: user, category: build(:category))
    idea2 = Idea.create!(name: "idea2", description: "learn", user: user, category: build(:category))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(user)

    expect(page).to have_content(idea1.name)
    expect(page).to have_content(idea1.description)
    expect(page).to have_content(idea2.name)
    expect(page).to have_content(idea2.description)
  end
end
