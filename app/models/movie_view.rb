class MovieView < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie
  belongs_to :user

  validates_presence_of :movie_id, :user_id

  def self.most_recent_viewed(user, count=3)
    MovieView.order('created_at DESC').where("user_id = ?", user.id).limit(count)
  end
end
