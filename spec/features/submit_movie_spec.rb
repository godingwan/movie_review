require 'spec_helper'

# As a User
# I want to add a movie for review
# So that I can get others to leave reviews on it

# Acceptance criteria -
# * I should be able to fill out a Submit Movie form/page
# * I must fill in all necessary information for the movie to be submitted (name, year, genre, etc)




describe "When adding a movie" do
  it "I should i have a form to add a movie" do
    visit '/movies/new'
    expect(page).to have_content("Title")
    expect(page).to have_content("Year")
    expect(page).to have_content("Genre")
    expect(page).to have_content("Director")
    expect(page).to have_content("Summary")
  end

end