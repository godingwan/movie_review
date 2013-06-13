class CreateMovieViews < ActiveRecord::Migration
  def change
    create_table :movie_views do |t|

      t.timestamps
    end
  end
end
