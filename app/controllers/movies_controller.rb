class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def create
    @movie = current_user.movies.build(params[:movie])
    # @movie = Movie.new(params[:movie])
    # @movie.contributor_id = current_user.id

    if @movie.save
      flash[:notice] = "Movie was created"
      redirect_to movies_path
    else
      render action: "new"
    end
  end
end


