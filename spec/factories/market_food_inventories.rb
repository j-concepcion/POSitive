# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :market_food_inventory do
    item_name "MyString"
    quantity 1
    date_purchased "2014-08-29"
  end
end
