require 'spec_helper'

describe 'user creating an account' do
  it 'checks that a user can successly sign up' do
    visit '/users/sign_up'

    fill_in "First name", :with => "blah"
    fill_in "Last name", :with => "fee"
    fill_in "Email", :with => "foo@buzz.com"
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  it "checks that user isn't created when fields aren't filled" do
    visit '/users/sign_up'

    click_button "Sign up"

    expect(page).to have_content("name can't be blank")
  end
end