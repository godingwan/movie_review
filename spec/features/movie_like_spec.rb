require 'spec_helper'

describe 'Movie Like' do
	before(:each) do
    Movie.destroy_all
    Review.destroy_all
    User.destroy_all
  end

	let(:simulate_user_log_in) do
		visit new_user_session_path
  	fill_in "Email", with: "a@a.com"
  	fill_in "Password", with: "123456789"
  	click_button "Sign in"
	end

	it "after liking a movie, I will be redirected back to the respective movie's page." do
		FactoryGirl.create(:movie)
		FactoryGirl.create(:user)
		simulate_user_log_in
		click_link "Show"
		click_button "Like this Movie"
		expect(page).to have_content("You have liked this movie.")
	end

end