FactoryBot.define do

  factory :contact do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    subject   { Faker::Lorem.word }
    message   { Faker::Lorem.sentence }
  end

end