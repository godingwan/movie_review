require 'spec_helper'

describe 'user can see all the movies' do
	before(:each) do
    Movie.destroy_all
  end
  it 'checks that movies are shown' do
    movie1 = FactoryGirl.create(:movie)
    movie2 = FactoryGirl.create(:movie)

    visit movies_path

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
  end
end
