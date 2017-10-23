require 'rails_helper'

describe "guest can sign up for site" do
  scenario "clicks on sign up from the welcome page" do
    visit root_path

    click_on "Sign up!"

    expect(current_path).to eq(new_user_path)
  end

  scenario "guest signs up and is taken to a user page" do
    visit new_user_path

    fill_in 'user[name]', with: 'Marshall'
    fill_in 'user[email]', with: 'marshall@marshall.com'
    fill_in 'user[password]', with: 'test'

    click_on 'Sign up!'

    expect(current_path).to eq(user_path(User.last))
  end
end
