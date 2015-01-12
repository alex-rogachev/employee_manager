# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!({first_name: 'Swan', last_name: 'Superuser', password: 'Swansoftwaresolutions', password_confirmation: 'Swansoftwaresolutions',
                 email: 'swan@superuser.com', admin: true}, without_protection: true)