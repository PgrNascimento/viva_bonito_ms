FactoryGirl.define do
  factory :tour do
    name 'Rio Sucuri'
    description Faker::Lorem.paragraph(2)
    category 'Flutuação'
    attraction 'Nascente Rio Sucuri'
    duration 60
    adult_price 200
    child_price 100
    baby_price 0
    distance 80
  end
end
