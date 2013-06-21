class AdminsController < ApplicationController
	load_and_authorize_resource

	def index
		@movie = Movie.all
		@review = Review.all
	end
end
