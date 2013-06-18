require 'spec_helper'

describe 'As a logged in user' do
	let(:user) {FactoryGirl.create(:user)}

	it ' I would like to see the last 3 movies that were added' do

		factorygirl1 = FactoryGirl.create(:movie, :created_at => Time.now-1.week)
		factorygirl2 = FactoryGirl.create(:movie, :created_at => Time.now-4.week)
		factorygirl3 = FactoryGirl.create(:movie, :created_at => Time.now-2.week)
		factorygirl4 = FactoryGirl.create(:movie, :created_at => Time.now-3.week)
		sign_in_as(user)
		save_and_open_page
		expect(page).to have_content 'Last 3 Movies Added'
		expect(page).to have_content factorygirl1.title
		expect(page).to_not have_content factorygirl2.title
		expect(page).to have_content factorygirl3.title
		expect(page).to have_content factorygirl4.title
	end
end