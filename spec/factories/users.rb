# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email { "#{first_name}.#{last_name}@#{Faker::Internet.domain_name}".downcase }
    password Faker::Internet.password(8)
    password_confirmation { "#{password}" }
    
    factory :admin_user do
      roles { ['admin'] }
    end
  end
end
