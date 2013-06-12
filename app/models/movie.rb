class Movie < ActiveRecord::Base
  attr_accessible :director, :genre, :summary, :title, :year
end
