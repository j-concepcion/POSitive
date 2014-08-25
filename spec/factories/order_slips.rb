# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_slip do
    order_type "MyString"
    table_number 1
    takeout_number 1
    quantity 1
  end
end
