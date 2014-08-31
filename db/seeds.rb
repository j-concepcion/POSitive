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
    item_name: 'Pork Asado',
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
    item_name: 'Sizzling Pork Steak',
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
    item_name: 'Antonov (Ice)',
    category: 'Drink',
    price: '40'}, {
    item_name: 'Antonov (Apple)',
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
    item_name: 'Mug Rootbeer (In Can)',
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
    item_name: 'Four-Seasons Juice',
    category: 'Drink',
    price: '30'}, {
    item_name: 'Bottled Water',
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
    price: '220'}, {
    item_name: 'Malboro Lights (20s)',
    category: 'Cigarettes',
    price: '70'}, {
    item_name: 'Malboro Lights (10s)',
    category: 'Cigarettes',
    price: '40'}, {
    item_name: 'Malboro Black (20s)',
    category: 'Cigarettes',
    price: '70'}, {
    item_name: 'Malboro Black (10s)',
    category: 'Cigarettes',
    price: '40'}, {
    item_name: 'Malboro Menthol (20s)',
    category: 'Cigarettes',
    price: '70'}, {
    item_name: 'Malboro Menthol (10s)',
    category: 'Cigarettes',
    price: '40'}, {
    item_name: 'Malboro Red (20s)',
    category: 'Cigarettes',
    price: '70'}, {
    item_name: 'Malboro Red (10s)',
    category: 'Cigarettes',
    price: '40'}, {
    item_name: 'Winston Red (10s)',
    category: 'Cigarettes',
    price: '70'}])

##########################################################
# INVENTORY
##########################################################
Inventory.create([{
    item_name: 'Coke (In Can)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Mountain Dew (In Can)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Mug Rootbeer (In Can)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Mango Juice',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Pineapple Juice',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Orange Juice',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Four-Seasons Juice',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Bottled Water',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Antonov (Ice)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Antonov (Apple)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Red Horse',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'San Mig Light',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Pale Pilsen',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Tanduay Rum',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Antonov (Ice)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Lights (20s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Lights (10s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Black (20s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Black (10s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Menthol (20s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Menthol (10s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Red (20s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Malboro Red (10s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Winston Red (20s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Winston Red (10s)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Bar Stocks"
    }, {
    item_name: 'Cheesy Potato',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'French Fries',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Cheese Sticks',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Chicken Wings',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Grilled Liempo',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Sizzling Pork Steak',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Nachos',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Sizzling Hungarian Sausage',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Corn',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Capri',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Spam',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Sausage',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Garlic Mushroom',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Tuna',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Nuts',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Cheese Squeeze',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Quick Melt',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Coffee(3-in-1)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Sunquick (Orange)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Sunquick (Lime)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Catsup',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Mayo Dip',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Seasoning',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Oyster Sauce',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Vinegar',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Soy Sauce',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Pinesol',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Dazz',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Zonrox',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Powder',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Bar',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Trash Bag (Small)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Trash Bag (Large)',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Air Freshener',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Baygon',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Alcohol',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Tissue Roll',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Order Slip',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Groceries"
    }, {
    item_name: 'Bacon',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Bologna',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Chix',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Cornedbeef',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Embo',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Hot',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Liempo',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Long',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Pork',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Tap',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'To',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Sisig',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Tokwa\'t Baboy',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Dynamite',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Lumpiang Shanghai',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Sisig Roll',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Pansit Canton',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Pansit Bihon',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Lomi',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Spaghetti',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Chicken-Pork Adobo',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Pork Asado',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Braised Beef',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Sweet & Sour Pork',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Dinuguan',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Ham',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Cheese',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Salted Egg',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Leche Flan',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }, {
    item_name: 'Gravy',
    quantity: (rand(5..50)).to_i,
    inventory_type: "Market Food Items"
    }])
