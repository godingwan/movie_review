class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :reviews
  has_many :review_likes
  has_many :review_views
  has_many :movies
  has_many :movies_likes
  has_many :movies_views

  validates_presence_of :email, :password, :password_confirmation, :first_name, :last_name
end
