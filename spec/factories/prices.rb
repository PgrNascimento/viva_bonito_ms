FactoryGirl.define do
  factory :price do
    tour nil
    start_date "2017-01-01"
    end_date "2017-06-30"
    adult_price "9.99"
    child_price "9.99"
    baby_price "9.99"
    season_type "MyString"
  end
end
