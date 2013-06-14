class ReviewsController < ApplicationController

	def new
		@review = Review.new

	end

	def create
		@review = Review.create(params[:review])
		if review.save
			redirect_to reviews_path
		end
	end

end
