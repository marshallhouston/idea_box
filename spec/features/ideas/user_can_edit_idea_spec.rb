require 'rails_helper'

describe "user edits an existing idea" do

  before :each do
    @user = create(:user)
    @category = Category.create!(name: "hobbies", description: "ideas for hobbies")
    @idea1 = Idea.create!(name: "idea1", description: "read", user: @user, category: build(:category))
    visit root_path
    click_on 'Log In'
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_on 'Log In'
  end

  it "changes information for an idea and it updates that information" do
    visit user_idea_path(@idea1.user, @idea1)

    click_on "Edit this idea"

    expect(current_path).to eq(edit_user_idea_path(@idea1.user, @idea1))

    fill_in "idea[name]", with: "LEARN!"
    fill_in "idea[description]", with: "new topics to learn"
    select 'hobbies', from: 'idea[category_id]'

    click_on "Update Idea"

    expect(current_path).to eq(user_idea_path(@idea1.user, @idea1))
    expect(page).to have_content("LEARN!")
    expect(page).to have_content("new topics to learn")
    expect(page).to have_content("hobbies")
    expect(page).to_not have_content("idea1")
    expect(page).to_not have_content("read")
    expect(page).to_not have_content("habits")
  end
end
