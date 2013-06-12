class CreateReviewLikes < ActiveRecord::Migration
  def change
    create_table :review_likes do |t|

      t.timestamps
    end
  end
end
