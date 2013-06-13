class MovieView < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie, :foreign_key => "movie_id", :class_name => "Movie"
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"

  validates_presence_of :movie_id, :user_id
end
