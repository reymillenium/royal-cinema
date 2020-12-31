FactoryBot.define do

  factory :reference do
    full_name         { Faker::Name.name }
    current_job_title { Faker::Job.title }
    linkedin_profile  { Faker::Internet.url }
    email             { Faker::Internet.email }
    mobile_number     { Faker::PhoneNumber.cell_phone }
    pertinent_date    { Faker::Time.backward(days: 365, period: :evening) }
    letter            { Faker::Lorem.sentence }
  end

end