require 'spec_helper'

describe 'Review Like' do
	let(:user) { FactoryGirl.create(:user) }

	it "after liking a review, I will be redirected back to the respective review's page" do
		FactoryGirl.create(:review)
		sign_in_as(user)
		visit root_path
		click_link "Details/Reviews"
		click_button "Like this Movie"
		expect(page).to have_content("You have liked this movie.")
	end
end