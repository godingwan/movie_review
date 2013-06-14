FactoryGirl.define do
  sequence :movie do |name|
    "Movie#{name}"
  end

  factory :movie do
    title { generate(:movie) }
    year "2013"
    genre "documentary"
    director "bob"
    summary "good story"
    contributor_id "1"
  end

  factory :review do
    score "5"
    body "this is the review"
    movie_id "1"
    contributor_id "1"
  end
end
