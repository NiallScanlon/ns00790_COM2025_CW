# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
user = User.create! :email => 'admin@admin.com', :password => 'admin', :isAdmin => '1'

barber1 = Barber.create! :id => 1, :name => 'Niall Scanlon', :email => 'niallscanlon98@outlook.com', :phone => '079033693249'
barber2 = Barber.create! :name => 'Jez Willis', :email => 'jezwills@outlook.com', :phone => '07903213249'
barber3 = Barber.create! :name => 'Mark Stevens', :email => 'markstevs@outlook.com', :phone => '07903362149'

