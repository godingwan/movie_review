class ReviewView < ActiveRecord::Base
  attr_accessible :review_id, :user_id

  belongs_to :review
  belongs_to :user

  validates_presence_of :review_id, :user_id

  def self.most_recent(count=3)
    order('created_at DESC').limit(count)
  end

  def self.for(user)
    where("user_id = ?", user.id)
  end
end
