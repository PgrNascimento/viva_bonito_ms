FactoryGirl.define do
  factory :price do
    tour
    start_date Date.today
    end_date Date.today + 3.days
    adult_price 100
    child_price 50
    baby_price 5
    season_type Price.season_types[:high_season]
  end
end
