class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      flash[:notice] = "Movie was created"
      redirect_to movies_path
    else
      render action: "new"
    end
  end
end


