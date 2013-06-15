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

  factory :user do
    first_name "a"
    last_name "e"
    email "a@a.com"
    password "123456789"
    password_confirmation "123456789"
  end
end
