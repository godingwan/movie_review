class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role

  has_many :reviews, inverse_of: :contributor, foreign_key: :contributor_id
  has_many :review_likes, inverse_of: :user
  has_many :review_views, inverse_of: :user
  has_many :movies, inverse_of: :contributor, foreign_key: :contributor_id
  has_many :movie_likes, inverse_of: :user
  has_many :movie_views, inverse_of: :user

  validates_presence_of :email, :password, :password_confirmation, :first_name, :last_name, :role
end
