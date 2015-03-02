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

user = AdminUser.new
user.email = 'admin@example.com'
user.password = 'password'
user.save

week1 = Week.new
week1.number = 1
week1.name = "Algoritmos en ruby 1"
week1.save

week2 = Week.new
week2.number = 2
week2.name = "Algoritmos en ruby 2"
week2.save

week3 = Week.new
week3.number = 3
week3.name = "Battleship + Objetos en ruby"
week3.save

week4 = Week.new
week4.number = 4
week4.name = "Objetos en ruby + HTTP"
week4.save

week5 = Week.new
week5.number = 5
week5.name = "BD + Rails"
week5.save

week6 = Week.new
week6.number = 6
week6.name = "JSON + Rails MC"
week6.save

week7 = Week.new
week7.number = 7
week7.name = "Service App"
week7.save

week8 = Week.new
week8.number = 8
week8.name = "HTML + CSS + Bootstrap"
week8.save

week9 = Week.new
week9.number = 9
week9.name = "Javascript"
week9.save

week10 = Week.new
week10.number = 10
week10.name = "Javascript + jQuery"
week10.save

week11 = Week.new
week11.number = 11
week11.name = "AngularJS"
week11.save

week12 = Week.new
week12.number = 12
week12.name = "AngularJS"
week12.save

week13 = Week.new
week13.number = 13
week13.name = "AngularJS"
week13.save

week14 = Week.new
week14.number = 14
week14.name = "AngularJS"
week14.save

# *********************** SEMANA1 ***********************

day1 = Day.new
day1.number = 1
day1.name = "CARNAVAL"
day1.week = week1
day1.status = 2
day1.save

day2 = Day.new
day2.number = 2
day2.name = "CARNAVAL"
day2.week = week1
day2.status = 2
day2.save

day3 = Day.new
day3.number = 3
day3.name = "Vagrant, entornos,comandos"
day3.week = week1
day3.status = 2
day3.save

day4 = Day.new
day4.number = 4
day4.name = "Variables, estructura de control"
day4.week = week1
day4.status = 2
day4.save

day5 = Day.new
day5.number = 5
day5.name = "Tipos de dato, estructura iterativas"
day5.week = week1
day5.status = 2
day5.save

# *********************** SEMANA1 ***********************

# *********************** SEMANA2 ***********************

day = Day.new
day.number = 6
day.name = "Estructuras iterativas, arreglos"
day.week = week2
day.status = 2
day.save

day = Day.new
day.number = 7
day.name = "Arreglos multidimensionales, funciones"
day.week = week2
day.status = 2
day.save

day = Day.new
day.number = 8
day.name = "Funciones, programacion estructurada"
day.week = week2
day.status = 2
day.save

day = Day.new
day.number = 9
day.name = "Practica de algoritmos"
day.week = week2
day.status = 2
day.save

day = Day.new
day.number = 10
day.name = "Ordenamiento en arreglos"
day.week = week2
day.status = 2
day.save

# *********************** SEMANA2 ***********************

# *********************** SEMANA3 ***********************

day = Day.new
day.number = 11
day.name = "Battleship 1"
day.week = week3
day.status = 1
day.save

day = Day.new
day.number = 12
day.name = "Battleship 2"
day.week = week3
day.status = 1
day.save

day = Day.new
day.number = 13
day.name = "Entrega Battleship"
day.week = week3
day.status = 1
day.save

day = Day.new
day.number = 14
day.name = "Objetos en Ruby 1"
day.week = week3
day.status = 1
day.save

day = Day.new
day.number = 15
day.name = "Objetos en Ruby 2"
day.week = week3
day.status = 1
day.save

# *********************** SEMANA3 ***********************

category1 = Category.new
category1.name = "Analisis"
category1.save

category2 = Category.new
category2.name = "Diseño"
category2.save

category3 = Category.new
category3.name = "Construccion"
category3.save

category4 = Category.new
category4.name = "Bug"
category4.save

challenge = Challenge.new
challenge.time = 'mañana'
challenge.title = 'Titulo del reto 1'
challenge.description = 'Contenido del reto 1'
challenge.category = category1
challenge.day = day1
challenge.save

challenge = Challenge.new
challenge.time = 'mañana'
challenge.title = 'Titulo del reto 2'
challenge.description = 'Contenido del reto 2'
challenge.category = category2
challenge.day = day1
challenge.save

challenge = Challenge.new
challenge.time = 'mañana'
challenge.title = 'Titulo del reto 3'
challenge.description = 'Contenido del reto 3'
challenge.category = category3
challenge.day = day1
challenge.save

challenge = Challenge.new
challenge.time = 'mañana'
challenge.title = 'Titulo del reto 4'
challenge.description = 'Contenido del reto 4'
challenge.category = category4
challenge.day = day1
challenge.save

challenge = Challenge.new
challenge.time = 'mañana'
challenge.title = 'Titulo del reto 4'
challenge.description = 'Contenido del reto 4'
challenge.category = category1
challenge.day = day1
challenge.save
