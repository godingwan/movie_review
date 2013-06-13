class Review < ActiveRecord::Base
  attr_accessible :body, :score, :contributor_id, :movie_id

  belongs_to :contributer, :class_name => "User"
  belongs_to :movie

  has_many :review_views
  has_many :review_likes

  validates_presence_of :body, :score, :contributor_id, :movie_id
end
