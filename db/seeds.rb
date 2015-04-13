@weeks = []
@days = []
@categories = []
@challenges = []
@parameters = []

def create_week number, name, position
  week = Week.new
  week.number = number
  week.name = name
  week.position = position
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

def create_user email, password, devise_class, github_user=nil
  user = devise_class.new
  user.email = email
  if password.length >= 8
    if github_user != nil
      user.github_user = github_user
    end
    user.password = password
    user.save
  else
    puts 'El password debe ser mayor a 8 caracteres'
  end
end

def create_parameter key, value
  param = Parameter.new
  param.key = key
  param.value = value
  param.save
  @parameters.push param
end

# *********************** PROMO 2 ***********************

create_user 'mentores@hack4geeks.co', 'Hack2015', User
create_user 'maldonmarco@gmail.com', '16433730', User, 'mmaldonado730'
create_user 'anggelica.virtlife.jt@gmail.com', '19500768', User, 'aherrera768'
create_user 'gen.reyest@gmail.com', '23592193', User, 'greyes193'
create_user 'gamezh81@gmail.com', '21601011', User, 'hgamez011'
create_user 'jamm@jmartinezm.org', '18619519', User, 'jmartinez519'
create_user 'samuel_021093@hotmail.com', '22694771', User, 'smelgarejo771'
create_user 'locke_din15@hotmail.com', '20089538', User, 'llopez538'
create_user 'luisdavidrn@gmail.com', '20116194', User, 'lrodriguez194'
create_user 'hector12j@gmail.com', '23644389', User, 'hcarreno389'
create_user 'alexballera@gmail.com', '08983523', User, 'aballera523'
create_user 'galindezj2@gmail.com', '24843057', User, 'jgalindez057'
create_user 'mariiromero17@gmail.com', '22017982', User, 'mromero942'

# *********************** PROMO 2 ***********************

create_user 'rramos@hack4geeks.co', 'Hack2015', AdminUser
create_user 'oarocha@hack4geeks.co', 'Hack2015', AdminUser
create_user 'etirado@hack4geeks.co', 'Hack2015', AdminUser
create_user 'despinoza@hack4geeks.co', 'Hack2015', AdminUser
create_user 'mgomez@hack4geeks.co', 'Hack2015', AdminUser
create_user 'agonzalez@hack4geeks.co', 'Hack2015', AdminUser
create_user 'jmanrique@hack4geeks.co', 'Hack2015', AdminUser
create_user 'alegonia@hack4geeks.co', 'Hack2015', AdminUser


create_week 1, "Algoritmos en ruby 1", 1
create_week 2, "Algoritmos en ruby 2", 2
create_week 3, "Battleship + Objetos en ruby", 3
create_week 4, "Objetos en ruby + HTTP", 4
create_week 5, "BD + Rails", 5
create_week 6, "JSON + Rails MC", 6
create_week 7, "Semana Santa", 7
create_week 8, "Service App", 8
create_week 9, "HTML + CSS + Bootstrap", 9
create_week 10, "Javascript", 10
create_week 11, "Javascript + jQuery", 11
create_week 12, "AngularJS", 12
create_week 13, "AngularJS", 13
create_week 14, "AngularJS", 14


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

create_day 11, "Battleship 1", @weeks[2], 2, '26.png'
create_day 12, "Battleship 2", @weeks[2], 2, '26.png'
create_day 13, "Entrega Battleship", @weeks[2], 2, '26.png'
create_day 14, "Objetos en Ruby 1", @weeks[2], 2, '26.png'
create_day 15, "Objetos en Ruby 2", @weeks[2], 2, '26.png'

# *********************** SEMANA 4 ***********************

create_day 16, "Objetos vs hashes en ruby", @weeks[3], 2, '27.png'
create_day 17, "Practica de orientacion a objetos", @weeks[3], 2, '27.png'
create_day 18, "RubyWarriors", @weeks[3], 2, '27.png'
create_day 19, "Inicio HTTP", @weeks[3], 2, '17.png'
create_day 20, "Practica HTTP + POSTMAN", @weeks[3], 2, '18.png'

# *********************** SEMANA 5 ***********************

create_day 21, "Modelado de datos", @weeks[4], 2, '22.png'
create_day 22, "Introduccion a SQL", @weeks[4], 2, '23.png'
create_day 23, "SQL 2", @weeks[4], 2, '23.png'
create_day 24, "MVC, Frameworks, Rails", @weeks[4], 2, '32.png'
create_day 25, "Modelos en rails 1", @weeks[4], 2, '32.png'

# *********************** SEMANA 6 ***********************

create_day 26, "Modelos en rails 2", @weeks[5], 1, '32.png'
create_day 27, "Git", @weeks[5], 1, '19.png'
create_day 28, "Controladores en Rails", @weeks[5], 1, '32.png'
create_day 29, "Modelos + Controladores en Rails", @weeks[5], 1, '32.png'
create_day 30, "Servicios Web, CRUD en Rails", @weeks[5], 1, '33.png'

# *********************** EXTRA! SEMANA 7 ***********************

create_day 31, "[EXTRA] Algoritmos basicos", @weeks[6], 1, '11.png'
create_day 32, "[EXTRA] Algoritmos intermedio", @weeks[6], 1, '12.png'
create_day 33, "[EXTRA] HTTP en ruby", @weeks[6], 1, '17.png'
create_day 34, "[EXTRA] Modelado de una BD", @weeks[6], 1, '22.png'
create_day 35, "[EXTRA] CRUD API en Rails", @weeks[6], 1, '33.png'

# *********************** SEMANA 8 ***********************

create_day 36, "Lunes", @weeks[7], 0
create_day 37, "Martes", @weeks[7], 0
create_day 38, "Miercoles", @weeks[7], 0
create_day 39, "Jueves", @weeks[7], 0
create_day 40, "Viernes", @weeks[7], 0

# *********************** SEMANA 9 ***********************

create_day 41, "Lunes", @weeks[8], 0
create_day 42, "Martes", @weeks[8], 0
create_day 43, "Miercoles", @weeks[8], 0
create_day 44, "Jueves", @weeks[8], 0
create_day 45, "Viernes", @weeks[8], 0

# *********************** SEMANA 10 ***********************

create_day 46, "Lunes", @weeks[9], 0
create_day 47, "Martes", @weeks[9], 0
create_day 48, "Miercoles", @weeks[9], 0
create_day 49, "Jueves", @weeks[9], 0
create_day 50, "Viernes", @weeks[9], 0

# *********************** SEMANA 11 ***********************

create_day 51, "Lunes", @weeks[10], 0
create_day 52, "Martes", @weeks[10], 0
create_day 53, "Miercoles", @weeks[10], 0
create_day 54, "Jueves", @weeks[10], 0
create_day 55, "Viernes", @weeks[10], 0

# *********************** SEMANA 12 ***********************

create_day 56, "Lunes", @weeks[11], 0
create_day 57, "Martes", @weeks[11], 0
create_day 58, "Miercoles", @weeks[11], 0
create_day 59, "Jueves", @weeks[11], 0
create_day 60, "Viernes", @weeks[11], 0

# *********************** SEMANA 13 ***********************

create_day 61, "Lunes", @weeks[12], 0
create_day 62, "Martes", @weeks[12], 0
create_day 63, "Miercoles", @weeks[12], 0
create_day 64, "Jueves", @weeks[12], 0
create_day 65, "Viernes", @weeks[12], 0

# *********************** SEMANA 14 ***********************

create_day 66, "Lunes", @weeks[13], 0
create_day 67, "Martes", @weeks[13], 0
create_day 68, "Miercoles", @weeks[13], 0
create_day 69, "Jueves", @weeks[13], 0
create_day 70, "Viernes", @weeks[13], 0


create_category "Analisis", 'analisis.png'
create_category "Diseño", 'design.png'
create_category "Construccion", 'construct.png'
create_category "Bug", 'bug.png'

# *********************** CHALLENGES ***********************

create_challenge 'manana', 'Entrega Battleship', 'Enunciado de battleship', @categories[2], @days[12]

# *********************** PARAMETERS ***********************

create_parameter "current_week", "7"
