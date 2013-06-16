FactoryGirl.define do
  sequence :movie do |name|
    "Generic Blockbuster Movie Number #{name}"
  end

  sequence :movie_like do |like|
    "#{like}"
  end

  factory :movie do
    title { generate(:movie) }
    year "2013"
    genre "Documentary"
    director "Bob Saget"
    summary "A cop turns to a mystical cat lady to convert into a ninja commando to save the world from a diabolical turtle hellbent on melting Antarctica."
    contributor_id "1"
  end

  factory :movie_for_like_test1, :class => Movie do
    title "Pretty Good Movie"
    year "2013"
    genre "Documentary"
    director "Bob Saget"
    summary "A cop turns to a mystical cat lady to convert into a ninja commando to save the world from a diabolical turtle hellbent on melting Antarctica."
    contributor_id "1"
    id "500"
  end

  factory :movie_for_like_test2, :class => Movie do
    title "Pretty Bad Movie"
    year "2013"
    genre "Documentary"
    director "Bob Saget"
    summary "A cop turns to a mystical cat lady to convert into a ninja commando to save the world from a diabolical turtle hellbent on melting Antarctica."
    contributor_id "1"
    id "501"
  end

  factory :movie_for_like_test3, :class => Movie do
    title "Pretty Even Movie"
    year "2013"
    genre "Documentary"
    director "Bob Saget"
    summary "A cop turns to a mystical cat lady to convert into a ninja commando to save the world from a diabolical turtle hellbent on melting Antarctica."
    contributor_id "100"
    id "502"
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

  factory :user_for_like_test, :class => User do
    id "100"
    first_name "a"
    last_name "e"
    email "a@a.com"
    password "123456789"
    password_confirmation "123456789"
  end

  factory :movie_like do
    user_id "1"
    movie_id { generate(:movie_like) }
  end

  factory :movie_like_specific1, :class => MovieLike do
    user_id "100"
    movie_id "500"
  end

  factory :movie_like_specific2, :class => MovieLike do
    user_id "100"
    movie_id "501"
  end

  factory :movie_like_specific3, :class => MovieLike do
    user_id "100"
    movie_id "502"
  end
end
