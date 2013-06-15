require 'spec_helper'

describe 'Reviews' do

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

		it 'should be listed on their respective movie page.' do
			FactoryGirl.create(:movie)
			FactoryGirl.create(:review)
			FactoryGirl.create(:user)
			simulate_user_log_in
  		click_link "Show"
  		fill_in "Movie Score", with: "5"
  		fill_in "Review", with: "Best movie ever."
  		click_button "Create Review"
  		expect(page).to have_content("Best movie ever.")
		end
end