class FixContributorSpellinginReviews < ActiveRecord::Migration
  def up
  	add_column :reviews, :contributor_id, :string
  	remove_column :reviews, :contributer_id
  end

  def down
  	add_column :reviews, :contributer_id, :string
  	remove_column :reviews, :contributor_id
  end
end
