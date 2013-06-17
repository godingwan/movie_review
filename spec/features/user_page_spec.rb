require 'spec_helper'

describe 'User Page' do

	let(:user) {FactoryGirl.create(:user)}


	before(:each) do
    Movie.destroy_all
    Review.destroy_all
    User.destroy_all
  end

  let(:create_movies_and_likes) do
  	FactoryGirl.create(:movie_for_like_test1)
		FactoryGirl.create(:movie_for_like_test2)
		FactoryGirl.create(:movie_for_like_test3)
		FactoryGirl.create(:movie_like_specific1)
		FactoryGirl.create(:movie_like_specific2)
		FactoryGirl.create(:movie_like_specific3)
  end

	it 'displays a list of movies the user has liked.' do
		user = FactoryGirl.create(:user_for_like_test)
		create_movies_and_likes
		visit new_user_session_path
  	fill_in "Email", :with => user.email
  	fill_in "Password", :with => user.password
  	click_button "Sign in"
		visit user_path(user.id)
		expect(page).to have_content("Pretty Good Movie")
		expect(page).to have_content("Pretty Bad Movie")
		expect(page).to have_content("Pretty Even Movie")
	end

	it "when I click on the liked movie's name, I should be sent to that movie's page." do
		user = FactoryGirl.create(:user_for_like_test)
		create_movies_and_likes
		visit new_user_session_path
  	fill_in "Email", :with => user.email
  	fill_in "Password", :with => user.password
  	click_button "Sign in"
		visit user_path(user.id)
		click_link "Pretty Good Movie"
		expect(page).to have_content("A cop turns to a mystical cat lady")
	end

	it 'I want to see my own show page' do


	end


end