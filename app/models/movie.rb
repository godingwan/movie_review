class Movie < ActiveRecord::Base
  attr_accessible :director, :genre, :summary, :title, :year, :contributor_id

  belongs_to :contributor, :class_name => "User", :foreign_key => "contributor_id"

  has_many :reviews, inverse_of: :movie
  has_many :movie_views, inverse_of: :movie
  has_many :movie_likes, inverse_of: :movie

  validates_presence_of :director, :genre, :summary, :title, :year, :contributor_id

  def add_recent_movie_view(user)
    @movie_view = movie_views.build
    @movie_view.user = user
    @movie_view.save
  end
end
