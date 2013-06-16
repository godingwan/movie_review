class MovieLikesController < ApplicationController
	def new
    @movie = Movie.find(params[:movie_id])
    @movie_like = @movie.movie_likes.build
  end

	def create
		@movie = Movie.find(params[:movie_id])
		@movie_like = @movie.movie_likes.build(params[:movie_like])
		@movie_like.user_id = current_user.id

		if @movie_like.save
      flash[:notice] = "You have liked this movie."
      redirect_to movie_path(@movie)
    else
      render action: "new"
   	end
	end
end