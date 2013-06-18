require 'spec_helper'

describe 'user can go to a movie page' do
  it 'returns a valid page' do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)

    expect(page).to have_content("2013")
  end
end

describe 'user can see more info on a movie' do
  it 'if they click on show link, more info is provided' do
    movie = FactoryGirl.create(:movie)
    visit movies_path

    click_link "Show"
    expect(page).to have_content(movie.title)
    expect(page).to have_content("2013")
    expect(page).to have_content("Documentary")
    expect(page).to have_content("Bob Saget")
    expect(page).to have_content("A cop turns to a mystical cat lady")
  end
end
