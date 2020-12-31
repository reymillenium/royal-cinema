FactoryBot.define do

  factory :contact do
    name      { Faker::Lorem.name }
    email     { Faker::Internet.email }
    subject   { Faker::Lorem.word }
    message   { Faker::Lorem.sentence }
  end

end