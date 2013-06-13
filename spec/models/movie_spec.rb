require 'spec_helper'

describe Movie do
  it "Movie is persisted when valid form filled out" do
    previous_count = Movie.all.count
    FactoryGirl.create(:movie)
    expect(Movie.all.count).to eq(previous_count + 1)
  end
end
