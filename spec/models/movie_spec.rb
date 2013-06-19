require 'spec_helper'

describe Movie do
  it "is persisted when valid form filled out" do
    previous_count = Movie.all.count
    FactoryGirl.create(:movie)
    expect(Movie.all.count).to eq(previous_count + 1)
  end

  it 'tests that add_recent_movie_view works' do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.create(:movie)

    movie.add_recent_movie_view(user)

    expect(MovieView.last.user).to eq(user)
  end
end
