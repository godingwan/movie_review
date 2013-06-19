require 'spec_helper'

describe 'As a logged in user' do
	let(:user) {FactoryGirl.create(:user)}
	let(:create_movies) do
		@factorygirl1 = FactoryGirl.create(:movie, :created_at => Time.now-1.week)
		@factorygirl2 = FactoryGirl.create(:movie, :created_at => Time.now-4.week)
		@factorygirl3 = FactoryGirl.create(:movie, :created_at => Time.now-2.week)
		@factorygirl4 = FactoryGirl.create(:movie, :created_at => Time.now-3.week)
	end

	it ' I would like to see the last 3 movies that were added' do
		create_movies

		sign_in_as(user)
		expect(page).to have_content 'Last 3 Movies Added'
		expect(page).to have_content @factorygirl1.title
		expect(page).to_not have_content @factorygirl2.title
		expect(page).to have_content @factorygirl3.title
		expect(page).to have_content @factorygirl4.title
	end

	it 'I would like to see the last 3 movies I viewed' do
		create_movies

		sign_in_as(user)

		visit movie_path(@factorygirl1)
		visit movie_path(@factorygirl2)
		visit movie_path(@factorygirl3)
		visit movie_path(@factorygirl4)
		visit user_path(user)

		expect(page).to have_content @factorygirl4.title
		expect(page).to have_content @factorygirl3.title
		expect(page).to have_content @factorygirl2.title
	end

	it 'allows me to click on a viewed movie title to go to that movie page' do
		create_movies

		sign_in_as(user)

		visit movie_path(@factorygirl1)
		visit movie_path(@factorygirl2)
		visit movie_path(@factorygirl3)
		visit movie_path(@factorygirl4)
		visit user_path(user)

		click_link @factorygirl4.title

		expect(page).to have_content @factorygirl4.summary
	end
end
