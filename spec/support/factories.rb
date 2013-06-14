FactoryGirl.define do
  factory :movie do
    title "hello"
    year "1984"
    genre "documentary"
    director "bob"
    summary "good story"
    contributor_id "1"
  end
end

FactoryGirl.define do
  factory :review do
    score "5"
    body "this is the review"
    movie_id "1"
    contributor_id "1"
  end
end