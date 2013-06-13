class ReviewView < ActiveRecord::Base
  attr_accessible :review_id, :user_id

  belongs_to :review, :foreign_key => "review_id", :class_name => "Review"
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"

  validates_presence_of :review_id, :user_id
end
