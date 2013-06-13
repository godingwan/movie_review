class CreateMovieLikes < ActiveRecord::Migration
  def change
    create_table :movie_likes do |t|

      t.timestamps
    end
  end
end
