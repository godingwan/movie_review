class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
		@last_3_movies_added = Movie.order('created_at DESC').limit(3)
    @last_3_movies_viewed = MovieView.order('created_at DESC')
                              .where("user_id = ?", @user.id).limit(3)
	end

end
