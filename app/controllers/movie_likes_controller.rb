class MovieLikesController < ApplicationController
	def new
    @movie = Movie.find(params[:movie_id])
    @movie_like = @movie.movie_likes.build
  end

	def create
		@movie = Movie.find(params[:movie_id])
		@movie_like = @movie.movie_likes.build(params[:movie_like])
		@movie_like.user = current_user

		if @movie_like.save
      redirect_to movie_path(@movie), notice: "You have liked this movie."
    else
      render action: "new"
   	end
	end
end
