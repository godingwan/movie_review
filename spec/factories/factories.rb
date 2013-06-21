FactoryGirl.define do
  sequence :movie_title do |n|
    "Generic Blockbuster Movie Number #{n}"
  end

  sequence :movie_like do |n|
    "#{n}"
  end

  factory :movie do
    sequence(:title) { |n| "Fake #{n} Title" }
    year "2013"
    genre "Documentary"
    director "Bob Saget"
    summary "A cop turns to a mystical cat lady to convert into a ninja commando to save the world from a diabolical turtle hellbent on melting Antarctica."
    association :contributor, factory: :user
  end

  factory :review do
    score "5"
    sequence(:body) { |n| "This movie #{n} was so bad that I fell asleep." }
    association :movie
    association :contributor, factory: :user
  end

  factory :user do
    first_name "a"
    last_name "e"
    sequence(:email) { |n| "user#{n}@exmaple.com" }
    password "123456789"
    password_confirmation "123456789"
    role "user"
  end

  factory :movie_like do
    association :user
    association :movie
  end

  factory :review_like do
    association :user
    association :review
  end
end
