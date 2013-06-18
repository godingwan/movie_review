require 'spec_helper'

describe 'Reviews' do
  let(:user) { FactoryGirl.create(:user) }

  let(:simulate_user_log_in) do
		visit new_user_session_path
  	fill_in "Email", with: "a@a.com"
  	fill_in "Password", with: "123456789"
  	click_button "Sign in"
	end

	it 'should be listed on their respective movie page.' do
		FactoryGirl.create(:movie)
		FactoryGirl.create(:review)
    sign_in_as(user)
		click_link "Show"
		fill_in "Movie Score", with: "5"
		fill_in "Review", with: "Best movie ever."
		click_button "Create Review"
		expect(page).to have_content("Best movie ever.")
	end
end
