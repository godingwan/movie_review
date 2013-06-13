class Movie < ActiveRecord::Base
  attr_accessible :director, :genre, :summary, :title, :year, :contributer_id

  belongs_to :user, :foreign_key => "contributer_id", :class_name => "User"

  has_many :reviews
  has_many :movie_views
  has_many :movie_likes

  validates_presence_of :director, :genre, :summary, :title, :year, :contributer_id
end
