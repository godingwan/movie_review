require 'spec_helper'

describe ReviewLike do
	it 'is added to the table when a review is liked.' do
		previous_count = ReviewLike.all.count
		FactoryGirl.create(:review_like)
		expect(ReviewLike.all.count).to eq(previous_count + 1)
	end

	it 'should not be added if review_id is empty.' do
		previous_count = ReviewLike.all.count
		like = FactoryGirl.build(:review_like)
		like.review_id = ""
		expect(like).to_not be_valid
	end

	it 'should not be added if user_id is empty.' do
		previous_count = ReviewLike.all.count
		like = FactoryGirl.build(:review_like)
		like.user_id = ""
		expect(like).to_not be_valid
	end
end
