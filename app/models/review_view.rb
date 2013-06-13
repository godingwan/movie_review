class ReviewView < ActiveRecord::Base
  attr_accessible :review_id, :user_id

  belongs_to :review
  belongs_to :user

  validates_presence_of :review_id, :user_id
end
