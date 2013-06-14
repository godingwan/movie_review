require 'spec_helper'

# As a User
# I want to add a review of a movie
# So that other people can read my review

# Acceptance criteria -
# * I should be able to fill out a Submit Review form on the movie page
# * I must fill in all necessary information for the review to be submitted (name, review text)

describe "When viewing a movie i want to add a review" do
  it "I should have a form to add a review" do
    visit '/reviews/new'
    expect(page).to have_content("Score")
    expect(page).to have_content("Review")
  end
end