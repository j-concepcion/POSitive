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
  password_confirmation: 'password'
)

1.upto(99) do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{"%02d" % i}@base.com",
    status: :active,
    roles: [User::ROLES[rand(User::ROLES.length)]],
    password: 'password',
    password_confirmation: 'password'
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
    price: '45'}])