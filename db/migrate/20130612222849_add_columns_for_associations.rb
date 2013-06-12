class AddColumnsForAssociations < ActiveRecord::Migration
  def up
  	add_column :movies, :contributer_id, :integer
  	add_column :movie_views, :movie_id, :integer
  	add_column :movie_views, :user_id, :integer
  	add_column :movie_likes, :movie_id, :integer
  	add_column :movie_likes, :user_id, :integer
  	add_column :reviews, :movie_id, :integer
  	add_column :reviews, :contributer_id, :integer
  	add_column :review_views, :review_id, :integer
  	add_column :review_views, :user_id, :integer
  	add_column :review_likes, :review_id, :integer
  	add_column :review_likes, :user_id, :integer
  end

  def down
  	remove_column :movies, :contributer_id
  	remove_column :movie_views, :movie_id
  	remove_column :movie_views, :user_id
  	remove_column :movie_likes, :movie_id
  	remove_column :movie_likes, :user_id
  	remove_column :reviews, :movie_id
  	remove_column :reviews, :contributer_id
  	remove_column :review_views, :review_id
  	remove_column :review_views, :user_id
  	remove_column :review_likes, :review_id
  	remove_column :review_likes, :user_id
  end
end
