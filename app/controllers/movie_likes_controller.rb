class MovieLikesController < ApplicationController
  # /movies/:movie_id/movie_likes/new
	def new
    @movie = Movie.find(params[:movie_id])
    @movie_like = @movie.movie_likes.build
  end

	def create
    # from the params, we can grab the id of the movie we need
		@movie = Movie.find(params[:movie_id])
		@movie_like = @movie.movie_likes.build(params[:movie_like])
		@movie_like.user = current_user

    # movies_path #=> /movies
    # movie_path(@movie) #=> /movies/:id_of_movie

    # movie_movie_like_path(@movie, @movie_like)
    # =>/movies/3/movie_likes/5

		if @movie_like.save
      # flash[:notice] = "You have liked this movie."
      redirect_to movie_path(@movie), notice: "You have liked this movie."
    else
      render action: "new"
   	end
	end
end
