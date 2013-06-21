require 'spec_helper'

describe "Admin dashboard" do
	let!(:admin) { FactoryGirl.create(:user, role: "admin") }
	let!(:user) { FactoryGirl.create(:user) }

	let!(:movie_1) { FactoryGirl.create(:movie, contributor: admin) }
	let!(:movie_2) { FactoryGirl.create(:movie, contributor: admin) }
	let!(:movie_3) { FactoryGirl.create(:movie, contributor: admin) }

	let!(:movie_like_1) do
		2.times { FactoryGirl.create(:movie_like, movie: movie_1, user: user) }
	end
	let!(:movie_like_2) do
		3.times { FactoryGirl.create(:movie_like, movie: movie_2, user: user) }
	end
	let!(:movie_like_3) do
		5.times { FactoryGirl.create(:movie_like, movie: movie_3, user: user) }
	end

	let!(:review_1) { FactoryGirl.create(:review, movie: movie_1, contributor: user) }
	let!(:review_2) { FactoryGirl.create(:review, movie: movie_2, contributor: user) }
	let!(:review_3) { FactoryGirl.create(:review, movie: movie_3, contributor: user) }

	let!(:review_like_1) do
		2.times { FactoryGirl.create(:review_like, review: review_1) }
	end
	let!(:review_like_2) do
		3.times { FactoryGirl.create(:review_like, review: review_2) }
	end
	let!(:review_like_3) do
		4.times { FactoryGirl.create(:review_like, review: review_3) }
	end

	it "cannot be accessed by a non-admin user." do
		sign_in_as(user)
		visit admins_path
		expect(page).to have_content("You are not authorized to access this page.")
	end

	it "shows a list of all movies with the amount of likes and reviews it has." do
		sign_in_as(admin)
		visit admins_path
		expect(page).to have_content(movie_1.title)
		expect(page).to have_content(movie_1.movie_likes.all.count)
		expect(page).to have_content(movie_1.reviews.all.count)
		expect(page).to have_content(movie_2.title)
		expect(page).to have_content(movie_2.movie_likes.all.count)
		expect(page).to have_content(movie_2.reviews.all.count)
		expect(page).to have_content(movie_3.title)
		expect(page).to have_content(movie_3.movie_likes.all.count)
		expect(page).to have_content(movie_3.reviews.all.count)
	end

	it "shows a list of all reviews with the amount of likes it has." do
		sign_in_as(admin)
		visit admins_path
		save_and_open_page
		expect(page).to have_content(review_1.body)
		expect(page).to have_content(review_1.review_likes.all.count)
		expect(page).to have_content(review_2.body)
		expect(page).to have_content(review_2.review_likes.all.count)
		expect(page).to have_content(review_3.body)
		expect(page).to have_content(review_3.review_likes.all.count)
	end

end