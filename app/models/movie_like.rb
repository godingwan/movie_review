class MovieLike < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie
  belongs_to :user

  validates_presence_of :movie_id, :user_id
end
