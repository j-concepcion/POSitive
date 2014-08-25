# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    item_name "MyString"
    category "MyString"
    price "9.99"
  end
end
