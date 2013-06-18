require 'spec_helper'

# As a User
# I want to add a review of a movie
# So that other people can read my review

# Acceptance criteria -
# * I should be able to fill out a Submit Review form on the movie page
# * I must fill in all necessary information for the review to be submitted (name, review text)

describe "When viewing a movie i want to add a review" do
  let(:user) { FactoryGirl.create(:user) }

	let(:simulate_user_log_in) do
		visit new_user_session_path
  	fill_in "Email", with: "a@a.com"
  	fill_in "Password", with: "123456789"
  	click_button "Sign in"
	end

  it "I should have a form to add a review" do
    FactoryGirl.create(:movie)
    visit '/'
    click_link 'Show'
    expect(page).to have_content("Movie Score")
    expect(page).to have_content("Review")
  end

  it 'and I should be redirected back to the movie page after submitting a valid review form.' do
  	FactoryGirl.create(:movie)
    sign_in_as(user)
  	click_link 'Show'
  	fill_in "Movie Score", with: "1"
  	fill_in "Review", with: "This movie was so bad that I fell asleep."
  	click_button "Create Review"
  	expect(page).to have_content("This movie was so bad that I fell asleep.")
	end
end
