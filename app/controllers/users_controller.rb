class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
		@last_3_movies_added = Movie.order('created_at DESC').limit(3)
	end

end
