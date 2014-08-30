# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory do
    item_name "MyString"
    quantity 1
    inventory_type "MyString"
  end
end
