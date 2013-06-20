describe Review do
  it "Review is persisted when valid form filled out" do
    previous_count = Review.all.count
    FactoryGirl.create(:review)
    expect(Review.all.count).to eq(previous_count + 1)
  end

  describe "scopes" do
    describe "most_recent_for" do
      it "returns the most the recent reviews for a given user"
    end
  end
end
