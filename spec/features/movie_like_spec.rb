require 'spec_helper'

describe 'Movie Like' do
  let(:user) { FactoryGirl.create(:user) }

	it "after liking a movie, I will be redirected back to the respective movie's page." do
		FactoryGirl.create(:movie)
		sign_in_as(user)
		click_link "Show"
		click_button "Like this Movie"
		expect(page).to have_content("You have liked this movie.")
	end
end
