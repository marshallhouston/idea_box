require 'rails_helper'

describe 'guests can log into site' do

  scenario 'guest fills out log in info and is taken to user page' do
    user = User.create!(name: 'sto', email: 'sto@sto.com', password: 'sto')
    visit root_path

    click_on 'Log In'

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.name}!")
  end
end
