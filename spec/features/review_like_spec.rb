require 'spec_helper'

describe 'Review Like' do
	let(:user) { FactoryGirl.create(:user) }

	it "after liking a review, I will be redirected back to the respective review's page" do
		review = FactoryGirl.create(:review)
		sign_in_as(user)
		click_link "Show"
		click_link "#{review.body}"
		click_button "Like this Review"
		expect(page).to have_content("You have liked this review.")
	end
end