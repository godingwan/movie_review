require 'spec_helper'

describe 'User Page' do
	# before(:each) do
 #    Movie.destroy_all
 #    Review.destroy_all
 #    User.destroy_all
 #  end

  # let(:create_movies_and_likes) do
  # 	FactoryGirl.create(:movie_for_like_test1)
		# FactoryGirl.create(:movie_for_like_test2)
		# FactoryGirl.create(:movie_for_like_test3)
		# FactoryGirl.create(:movie_like_specific1)
		# FactoryGirl.create(:movie_like_specific2)
		# FactoryGirl.create(:movie_like_specific3)
  # end

  let(:user) { FactoryGirl.create(:user) }
  let!(:movie_like_1) { FactoryGirl.create(:movie_like, user: user) }
  let!(:movie_like_2) { FactoryGirl.create(:movie_like, user: user) }
  let!(:movie_like_3) { FactoryGirl.create(:movie_like, user: user) }

	it 'displays a list of movies the user has liked.' do
		visit sign_in_as(user)
		visit user_path(user)
    expect(page).to have_content movie_like_1.title
    expect(page).to have_content movie_like_2.title
    expect(page).to have_content movie_like_3.title
	end

	it "when I click on the liked movie's name, I should be sent to that movie's page." do
		visit user_path(user.id)
    click_link "Pretty Good Movie"
    expect(page).to have_content("A cop turns to a mystical cat lady")
  end
end
