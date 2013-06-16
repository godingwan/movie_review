class Movie < ActiveRecord::Base
  attr_accessible :director, :genre, :summary, :title, :year, :contributor_id

  belongs_to :contributor, :class_name => "User", :foreign_key => "contributor_id"

  has_many :reviews, inverse_of: :movie
  has_many :movie_views, inverse_of: :movie
  has_many :movie_likes, inverse_of: :movie, foreign_key: :movie_id

  validates_presence_of :director, :genre, :summary, :title, :year, :contributor_id
end
