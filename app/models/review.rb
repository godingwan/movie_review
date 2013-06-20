class Review < ActiveRecord::Base
  attr_accessible :body, :score, :contributor_id, :movie_id

  belongs_to :contributor, :class_name => "User"
  belongs_to :movie

  has_many :review_views
  has_many :review_likes

  validates_presence_of :body, :score, :contributor_id, :movie_id

  def add_recent_review_view(user)
  	@review_view = review_views.build
  	@review_view.user = user
  	@review_view.save
  end


end
