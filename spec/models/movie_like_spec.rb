require 'spec_helper'

describe MovieLike do
	it 'is added to the table when a movie is liked.' do
		previous_count = MovieLike.all.count
		FactoryGirl.create(:movie_like_specific1)
		expect(MovieLike.all.count).to eq(previous_count + 1)
	end

	it 'should not be added if movie_id is empty.' do
		previous_count = MovieLike.all.count
		like = FactoryGirl.build(:movie_like_specific1)
		like.movie_id = ""
		expect(like).to_not be_valid
	end

	it 'should not be added if user_id is empty.' do
		previous_count = MovieLike.all.count
		like = FactoryGirl.build(:movie_like_specific1)
		like.user_id = ""
		expect(like).to_not be_valid
	end
end
