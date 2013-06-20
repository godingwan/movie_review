require 'spec_helper'

describe 'admin', %q{

As an Admin
I want to see stats about each movie
So that I can see which ones are the most popular

} do

# Acceptance criteria -
# * I should be able to go to the movie's page and see counters for likes/number of reviews/etc
# * If i am not an admin I shouldn't be able to see counters for likes/numbers of reviews/etc.

  let!(:movie){FactoryGirl.create(:movie)}

  describe 'as an admin' do
    it 'I should see counters for likes on movie show page' do
      FactoryGirl.create(:movie)
      admin=FactoryGirl.create(:user, :role => 'admin')
      sign_in_as(admin)
      visit movie_path(movie)
      expect(page).to have_content 'users have liked this movie'
    end
  end

  describe 'as a user without admin rights' do
    it 'I should not be able to see counters for likes on movie show page' do
      user=FactoryGirl.create(:user, :role => 'user')
      sign_in_as(user)
      visit movie_path(movie)
      expect(page).to_not have_content 'users have liked this movie'
    end
  end

  describe 'as a user not logged in' do
    it 'I should not be able to see counters for likes on movie show page' do
      visit movie_path(movie)
      expect(page).to_not have_content 'users have liked this movie'
    end
  end

end
