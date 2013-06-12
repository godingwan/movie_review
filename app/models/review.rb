class Review < ActiveRecord::Base
  attr_accessible :body, :score, :contributer_id, :movie_id

  belongs_to :user, :foreign_key => "contributer_id", :class_name => "User"
  belongs_to :movie, :foreign_key => "movie_id", :class_name => "Movie"

  has_many :review_views
  has_many :review_likes

  validates_presence_of :body, :score, :contributer_id, :movie_id
end
