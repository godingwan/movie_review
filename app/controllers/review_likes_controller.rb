class ReviewLikesController < ApplicationController
	def new
		@review = Review.find(params[:review_id])
		@review_like = @review.review_likes.build
	end

	def create
		@review = Review.find(params[:review_id])
		@review_like = @review.review_likes.build(params[:review_like])
		@review_like.user = current_user

		if @review_like.save
			redirect_to movie_review_path(@review.movie, @review), notice: "You have liked this review."
		else
			render action: "new"
		end
	end
end