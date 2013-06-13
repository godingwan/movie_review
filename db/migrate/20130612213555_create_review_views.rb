class CreateReviewViews < ActiveRecord::Migration
  def change
    create_table :review_views do |t|

      t.timestamps
    end
  end
end
