require 'rails_helper'

describe "user can delete an idea" do

  before :each do
    @user = create(:user)
    @idea1 = Idea.create!(name: "idea1", description: "read", user: @user, category: build(:category))
  end

  it "clicks delete and the idea is removed" do
    visit user_idea_path(@idea1.user, @idea1)
    
    click_on 'Delete this idea'

    expect(current_path).to eq(user_ideas_path(@user))
    expect(page).to have_content(@user.name)
    expect(page).to_not have_content(@idea1.name)
    expect(page).to_not have_content(@idea1.description)
  end
end
