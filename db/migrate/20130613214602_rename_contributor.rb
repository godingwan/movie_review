class RenameContributor < ActiveRecord::Migration
  def up
    add_column :movies, :contributor_id, :integer
    remove_column :movies, :contributer_id
  end

  def down
    remove_column :movies, :contributor_id
    add_column :movies, :contributer_id, :integer
  end
end
