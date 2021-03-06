require 'rails_helper'

describe "user creates new idea" do
  scenario "creates new idea" do
    user = create(:user)
    create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on('Create a new idea')

    expect(current_path).to eq(new_user_idea_path(user))

    fill_in 'idea[name]', with: "read"
    fill_in 'idea[description]', with: "novels or magazines"
    select 'habits', from: 'idea[category_id]'

    click_on 'Create Idea'

    expect(current_path).to eq(user_idea_path(user, Idea.last))

    expect(page).to have_content("read")
    expect(page).to have_content("novels or magazines")
    expect(page).to have_content("habits")
  end
end
