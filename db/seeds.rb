# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = 'rramos@4geeks.co'
user.password = '12345678'
user.save

week1 = Week.new
week1.number = 1
week1.name = "Aprendiendo a aprender"
week1.save

week2 = Week.new
week2.number = 2
week2.name = "No me hagas pensar!"
week2.save

week3 = Week.new
week3.number = 3
week3.name = "Flujo y control, algoritmos"
week3.save

day = Day.new
day.number = 1
day.name = "HTML 1"
day.week = week1
day.save

day = Day.new
day.number = 2
day.name = "HTML 2"
day.week = week1
day.save

day = Day.new
day.number = 3
day.name = "CSS 1"
day.week = week1
day.save

day = Day.new
day.number = 4
day.name = "CSS 2"
day.week = week1
day.save

day = Day.new
day.number = 5
day.name = "Bootstrap 1"
day.week = week1
day.save
