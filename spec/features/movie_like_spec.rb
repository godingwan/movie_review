require 'spec_helper'

describe 'Movie Like' do
  let(:user) { FactoryGirl.create(:user) }

	let(:simulate_user_log_in) do
		visit new_user_session_path
  	fill_in "Email", with: "a@a.com"
  	fill_in "Password", with: "123456789"
  	click_button "Sign in"
	end

	it "after liking a movie, I will be redirected back to the respective movie's page." do
		FactoryGirl.create(:movie)
		sign_in_as(user)
		click_link "Show"
		click_button "Like this Movie"
		expect(page).to have_content("You have liked this movie.")
	end
end
