# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory do
    item_name "MyString"
    quantity 1
    buying_price "9.99"
    selling_price "9.99"
    date_purchased "2014-08-28"
    expiration_date "2014-08-28"
    waste_age "MyString"
  end
end
