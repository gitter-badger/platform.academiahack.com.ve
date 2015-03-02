@weeks = []
@days = []
@categories = []
@challenges = []

def create_week number, name
  week = Week.new
  week.number = number
  week.name = name
  week.save
  @weeks.push week
end

def create_day number, name, week, status, image = '0.png'
  day = Day.new
  day.number = number
  day.name = name
  day.image = File.new("#{Rails.root}/app/assets/images/#{image}")
  day.week = week
  day.status = status
  day.save
  @days.push day
end

def create_category name, image
  category = Category.new
  category.name = name
  category.image = File.new("#{Rails.root}/app/assets/images/#{image}")
  category.save
  @categories.push category
end

def create_challenge time, title, description, category, day
  challenge = Challenge.new
  challenge.time = time
  challenge.title = title
  challenge.description = description
  challenge.category = category
  challenge.day = day
  challenge.save
  @challenges.push challenge
end

def create_user email, password, devise_class
  user = devise_class.new
  user.email = email
  user.password = password
  user.save
end

create_user 'rramos@4geeks.co', '12345678', User
create_user 'admin@example.com', 'password', AdminUser


create_week 1, "Algoritmos en ruby 1"
create_week 2, "Algoritmos en ruby 2"
create_week 3, "Battleship + Objetos en ruby"
create_week 4, "Objetos en ruby + HTTP"
create_week 5, "BD + Rails"
create_week 6, "JSON + Rails MC"
create_week 7, "Service App"
create_week 8, "HTML + CSS + Bootstrap"
create_week 9, "Javascript"
create_week 10, "Javascript + jQuery"
create_week 11, "AngularJS"
create_week 12, "AngularJS"
create_week 13, "AngularJS"


# *********************** SEMANA1 ***********************

create_day 1, "CARNAVAL 1", @weeks[0], 2
create_day 2, "CARNAVAL 2", @weeks[0], 2
create_day 3, "Vagrant, entornos,comandos", @weeks[0], 2, '16.png'
create_day 4, "Variables, estructura de control", @weeks[0], 2, '11.png'
create_day 5, "Tipos de dato, estructura iterativas", @weeks[0], 2, '11.png'

# *********************** SEMANA2 ***********************

create_day 6, "Estructuras iterativas, arreglos", @weeks[1], 2, '12.png'
create_day 7, "Arreglos multidimensionales, funciones", @weeks[1], 2, '12.png'
create_day 8, "Funciones, programacion estructurada", @weeks[1], 2, '13.png'
create_day 9, "Practica de algoritmos", @weeks[1], 2, '13.png'
create_day 10, "Ordenamiento en arreglos", @weeks[1], 2, '13.png'

# *********************** SEMANA3 ***********************

create_day 11, "Battleship 1", @weeks[2], 1, '26.png'
create_day 12, "Battleship 2", @weeks[2], 1, '26.png'
create_day 13, "Entrega Battleship", @weeks[2], 1, '26.png'
create_day 14, "Objetos en Ruby 1", @weeks[2], 1, '26.png'
create_day 15, "Objetos en Ruby 2", @weeks[2], 1, '26.png'

# *********************** SEMANA3 ***********************

create_category "Analisis", 'analisis.png'
create_category "Diseño", 'design.png'
create_category "Construccion", 'construct.png'
create_category "Bug", 'bug.png'

create_challenge 'manana', 'Entrega Battleship', 'Enunciado de battleship', @categories[2], @days[12]
