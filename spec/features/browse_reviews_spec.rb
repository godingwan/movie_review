require 'spec_helper'

describe 'Reviews' do
  let(:user) { FactoryGirl.create(:user) }

	it 'should be listed on their respective movie page.' do
		FactoryGirl.create(:review)
    sign_in_as(user)
		click_link "Show"
		fill_in "Movie Score", with: "5"
		fill_in "Review", with: "Best movie ever."
		click_button "Create Review"
		expect(page).to have_content("Best movie ever.")
	end
end
