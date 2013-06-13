class MoviesController < ApplicationController

def new
  @movie = Movie.new
end

def index
  @movies = Movie.all
end

def create

end

end


