FactoryGirl.define do
  factory :movie do
    # defaults
    title 'A Fake Title'
    rating 'PG'
    release_date {10.years.ago}
    director 'Bob'
  end
end
