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
    expect(page).to have_content("hello")
    expect(page).to have_content("2013")
    expect(page).to have_content("documentary")
    expect(page).to have_content("bob")
    expect(page).to have_content("good story")
  end
end
