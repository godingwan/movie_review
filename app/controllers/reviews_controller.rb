class ReviewsController < ApplicationController
	before_filter :load_movie

	def new
		@review = @movie.reviews.new
	end

	def create
		@review = @movie.reviews.new(params[:review])
		@review.contributor_id = current_user.id

		if @review.save
			flash[:notice] = "Your review was posted."
			redirect_to @movie
		else
			render action: "new"
		end
	end

	def show
		@review = @movie.reviews.find(params[:id])
	end

	private

    def load_movie
      @movie = Movie.find(params[:movie_id])
    end

end
