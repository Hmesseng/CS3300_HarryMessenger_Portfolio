FactoryBot.define do
    factory :student do
      email { Faker::Internet.email }
      password { "password"} 
      password_confirmation { "password" }
     # confirmed_at { Date.today }
    end
  end