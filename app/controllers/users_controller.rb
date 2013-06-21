class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
		@last_3_movies_added = Movie.most_recent_added(3)
    @last_3_movies_viewed = MovieView.most_recent_viewed(@user, 3)
    @last_3_reviews_viewed = Review.most_recent_for(@user, 3)
	end

end
