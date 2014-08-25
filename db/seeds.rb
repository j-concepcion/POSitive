# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PublicActivity.enabled = false

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
