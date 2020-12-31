FactoryBot.define do

  factory :skill do
    name        { Faker::Lorem.word }
    color       { Faker::Color.hex_color }
    percentage  { Faker::Number.between(from: 5, to: 100) }
  end

end