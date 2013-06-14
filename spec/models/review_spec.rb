describe Review do
  it "Review is persisted when valid form filled out" do
    previous_count = Review.all.count
    FactoryGirl.create(:review)
    expect(Review.all.count).to eq(previous_count + 1)
  end
end