require 'rails_helper'

describe 'user can logout' do
  scenario 'by clicking the log out link' do
    default_user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit user_path(default_user)

    click_link "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logged Out")
  end
end
