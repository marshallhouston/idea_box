require 'rails_helper'

describe "guest can sign up for site" do
  scenario "clicks on sign up from the welcome page" do
    visit root_path

    click_on "Sign up!"

    expect(current_path).to eq(new_user_path)
  end
end
