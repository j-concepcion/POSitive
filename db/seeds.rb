# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PublicActivity.enabled = false

##########################################################
# USERS
##########################################################

User.create(
  first_name: 'System',
  last_name: 'Administrator',
  email: 'sysad@base.com',
  status: :active,
  roles: ['admin'],
  password: 'password',
  password_confirmation: 'password',
  age: (rand(1..100)).to_i,
  birthday: (rand(20..40.years)).ago,
  contact_number: Faker::PhoneNumber.phone_number,
  address: (Faker::Address.street_address+Faker::Address.city+Faker::Address.state).to_s
)

1.upto(5) do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{i}@base.com",
    status: :active,
    roles: [User::ROLES[rand(User::ROLES.length)]],
    password: 'password',
    password_confirmation: 'password',
    age: (rand(1..100)).to_i,
    birthday: (rand(20..40.years)).ago,
    contact_number: Faker::PhoneNumber.phone_number,
    address: (Faker::Address.street_address+Faker::Address.city+Faker::Address.state).to_s
    )
end

6.upto(10) do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{i}@base.com",
    status: :active,
    roles: [User::ROLES[rand(User::ROLES.length)]],
    password: 'password',
    password_confirmation: 'password',
    age: (rand(1..100)).to_i,
    birthday: (rand(20..40.years)).ago,
    contact_number: Faker::PhoneNumber.phone_number,
    address: (Faker::Address.street_address+Faker::Address.city+Faker::Address.state).to_s
    )
end

##########################################################
# PRODUCTS (MENU)
##########################################################

Product.create(
  [{item_name: 'Sisigsilog',
    category: 'Silog',
    price: '50'}, {
    item_name: 'Tapsilog',
    category: 'Silog',
    price: '55'}, {
    item_name: 'Spamsilog',
    category: 'Silog',
    price: '60'}, {
    item_name: 'Chixilog',
    category: 'Silog',
    price: '60'}, {
    item_name: 'Porksilog',
    category: 'Silog',
    price: '60'}, {
    item_name: 'Bolognasilog',
    category: 'Silog',
    price: '45'}, {
    item_name: 'Hotsilog',
    category: 'Silog',
    price: '45'}, {
    item_name: 'Baconsilog',
    category: 'Silog',
    price: '60'}, {
    item_name: 'Liemposilog',
    category: 'Silog',
    price: '60'}, {
    item_name: 'Tosilog',
    category: 'Silog',
    price: '45'}, {
    item_name: 'Sausagesilog',
    category: 'Silog',
    price: '50'}, {
    item_name: 'Longsilog',
    category: 'Silog',
    price: '40'}, {
    item_name: 'Cornedbeefsilog',
    category: 'Silog',
    price: '40'}, {
    item_name: 'Embosilog',
    category: 'Silog',
    price: '45'}, {
    item_name: 'Braised Beef',
    category: 'Rice Topping',
    price: '65'}, {
    item_name: 'Chicken-Pork Adobo',
    category: 'Rice Topping',
    price: '55'}, {
    item_name: 'Pork Asad',
    category: 'Rice Topping',
    price: '55'}, {
    item_name: 'Sweet & Sour Pork',
    category: 'Rice Topping',
    price: '55'}, {
    item_name: 'Dinuguan',
    category: 'Rice Topping',
    price: '55'}, {
    item_name: 'Pansit Canton',
    category: 'Noodles',
    price: '60'}, {
    item_name: 'Pansit Bihon',
    category: 'Noodles',
    price: '60'}, {
    item_name: 'Spaghetti',
    category: 'Noodles',
    price: '60'}, {
    item_name: 'Lomi',
    category: 'Noodles',
    price: '60'}, {
    item_name: 'Bacon & Egg',
    category: 'Sandwich',
    price: '60'}, {
    item_name: 'Ham & Cheese',
    category: 'Sandwich',
    price: '45'}, {
    item_name: 'Ham & Egg',
    category: 'Sandwich',
    price: '45'}, {
    item_name: 'Ham, Cheese & Egg',
    category: 'Sandwich',
    price: '55'}, {
    item_name: 'Hotdog Sandwich',
    category: 'Sandwich',
    price: '40'}, {
    item_name: 'Spam Sandwich',
    category: 'Sandwich',
    price: '55'}, {
    item_name: 'Spam & Egg',
    category: 'Sandwich',
    price: '60'}, {
    item_name: 'Tuna',
    category: 'Sandwich',
    price: '40'}, {
    item_name: 'Egg Sandwich',
    category: 'Sandwich',
    price: '35'}, {
    item_name: 'Plain Rice',
    category: 'Extra',
    price: '15'}, {
    item_name: 'Plain Rice (Half)',
    category: 'Extra',
    price: '8'}, {
    item_name: 'Fied Rice',
    category: 'Extra',
    price: '18'}, {
    item_name: 'Fried Rice (Half)',
    category: 'Extra',
    price: '10'}, {
    item_name: 'Garlic Rice',
    category: 'Extra',
    price: '18'}, {
    item_name: 'Garlic Rice (Half)',
    category: 'Extra',
    price: '10'}, {
    item_name: 'Egg',
    category: 'Extra',
    price: '10'}, {
    item_name: 'Cheese',
    category: 'Extra',
    price: '12'}, {
    item_name: 'Gravy',
    category: 'Extra',
    price: '15'}, {
    item_name: 'Mayo Dip',
    category: 'Extra',
    price: '7'}, {
    item_name: 'Hotdog',
    category: 'Extra',
    price: '25'}, {
    item_name: 'Catsup',
    category: 'Extra',
    price: '3'}, {
    item_name: 'Salted Egg w/ Tomato',
    category: 'Extra',
    price: '20'}, {
    item_name: 'Leche Flan',
    category: 'Extra',
    price: '25'}, {
    item_name: 'Mentos',
    category: 'Extra',
    price: '2'}, {
    item_name: 'Sizzling Sisig',
    category: 'Classic',
    price: '90'}, {
    item_name: 'Sizzling Chicken',
    category: 'Classic',
    price: '130'}, {
    item_name: 'Cheesy Potato',
    category: 'Classic',
    price: '125'}, {
    item_name: 'Grilled Liempo',
    category: 'Classic',
    price: '95'}, {
    item_name: 'Tokwa\'t Baboy',
    category: 'Classic',
    price: '75'}, {
    item_name: 'Sizzling Hotdog',
    category: 'Classic',
    price: '95'}, {
    item_name: 'Sizzling Hungarian Sausage',
    category: 'Classic',
    price: '95'}, {
    item_name: 'French Fries (Reg)',
    category: 'Classic',
    price: '95'}, {
    item_name: 'French Fries (Jr)',
    category: 'Classic',
    price: '45'}, {
    item_name: 'Sizzling Prok Steak',
    category: 'Classic',
    price: '135'}, {
    item_name: 'Chicken Wings',
    category: 'Classic',
    price: '100'}, {
    item_name: 'Nachos',
    category: 'Classic',
    price: '105'}, {
    item_name: 'Dynamite',
    category: 'Classic',
    price: '75'}, {
    item_name: 'Garlic Mushroom',
    category: 'Classic',
    price: '95'}, {
    item_name: 'Cheese Sticks',
    category: 'Classic',
    price: '60'}, {
    item_name: 'Cheesy Corn',
    category: 'Classic',
    price: '65'}, {
    item_name: 'Onion Rings',
    category: 'Classic',
    price: '95'}, {
    item_name: 'Nuts',
    category: 'Classic',
    price: '60'}, {
    item_name: 'Lumpiang Shanghai',
    category: 'Classic',
    price: '120'}, {
    item_name: 'Sisig Roll',
    category: 'Classic',
    price: '110'}, {
    item_name: 'San Mig Light',
    category: 'Drink',
    price: '40'}, {
    item_name: 'Antonov',
    category: 'Drink',
    price: '40'}, {
    item_name: 'Red Horse',
    category: 'Drink',
    price: '45'}, {
    item_name: 'Iced Tea (Glass)',
    category: 'Drink',
    price: '15'}, {
    item_name: 'Iced Tea (Pitcher)',
    category: 'Drink',
    price: '50'}, {
    item_name: 'Pale Pilsen',
    category: 'Drink',
    price: '40'}, {
    item_name: 'Mountain Dew (In Can)',
    category: 'Drink',
    price: '18'}, {
    item_name: 'Coke (In Can)',
    category: 'Drink',
    price: '30'}, {
    item_name: 'Mug Rootbear (In Can)',
    category: 'Drink',
    price: '30'}, {
    item_name: 'Pineapple Juice',
    category: 'Drink',
    price: '30'}, {
    item_name: 'Orange Juice',
    category: 'Drink',
    price: '30'}, {
    item_name: 'Mango Juice',
    category: 'Drink',
    price: '45'}, {
    item_name: 'Bottle Water',
    category: 'Drink',
    price: '15'}, {
    item_name: 'Coffee (3-in-1)',
    category: 'Drink',
    price: '15'}, {
    item_name: 'Mindoro Sling',
    category: 'Drink',
    price: '300'}, {
    item_name: 'Rum Coke',
    category: 'Drink',
    price: '220'}])
