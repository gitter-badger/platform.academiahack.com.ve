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

# *********************** PROMO 3 ***********************



create_user 'mentores@hack4geeks.co', 'Hack2015', User

create_user 'christianpetersen@hotmail.com', '17424223', User, 'cpetersen223'
create_user 'danielitox222@gmail.com', '24271083', User, 'dguzzo083'
create_user 'd.rondonaguilera@gmail.com', '26473500', User, 'drondon500'
create_user 'johanna.salazar.b@gmail.com', '18358568', User, 'jsalazar568'
create_user 'johansanchez2101@gmail.com', '22774308', User, 'jsanchez308'
create_user 'jorgeloaiza12@gmail.com', '20802018', User, 'jloaiza018'
create_user 'meg_1703@hotmail.com', '18816824', User, 'mgraterol824'
create_user 'miguelacs18@gmail.com', '22019828', User, 'mcamacho828'
create_user 'nerumarcano@gmail.com', '23597368', User, 'nmarcano368'
create_user 'scarleth1306@gmail.com', '21132969', User, 'sbernal969'
#FALTA ESTEBAN REYES JR.



# *********************** PROMO 3 ***********************

create_user 'rramos@hack4geeks.co', 'Hack2015', AdminUser
create_user 'oarocha@hack4geeks.co', 'Hack2015', AdminUser
create_user 'despinoza@hack4geeks.co', 'Hack2015', AdminUser
create_user 'agonzalez@hack4geeks.co', 'Hack2015', AdminUser
create_user 'jmanrique@hack4geeks.co', 'Hack2015', AdminUser
create_user 'alegonia@hack4geeks.co', 'Hack2015', AdminUser

# *********************** PROPEDEUTICO ***********************
create_week 1, "Algoritmos en ruby 1", 1
create_week 2, "Algoritmos en ruby 2", 2
# *********************** PROPEDEUTICO ***********************
# *********************** BACKEND ***********************
create_week 3, "Ruby idiomatico + objetos en ruby", 3
create_week 4, "Objetos en ruby + HTTP", 4
create_week 5, "BD + Rails", 5
create_week 6, "JSON + Rails MC", 6
create_week 7, "Backend week", 7
# *********************** BACKEND ***********************
# *********************** FRONTEND ***********************
create_week 8, "Maquetacion 1", 8
create_week 9, "Maquetacion 2", 9
create_week 10, "Javascript", 10
create_week 11, "Javascript + jQuery", 11
create_week 12, "ReactJS", 12
create_week 13, "ReactJS", 13
create_week 14, "Frontend week", 14
# *********************** FRONTEND ***********************


# *********************** SEMANA1 ***********************

create_day 1, "Linux, terminal, usuarios, VM", @weeks[0], 1, '16.png'
create_day 2, "Busquedas, vcs, git, github", @weeks[0], 1, '19.png'
create_day 3, "Variables, tipos de dato, estructura de control", @weeks[0], 1, '11.png'
create_day 4, "Estructuras iterativas, arreglos", @weeks[0], 1, '12.png'
create_day 5, "Arreglos, ordenamiento basico", @weeks[0], 1, '13.png'

# *********************** SEMANA2 ***********************

create_day 6, "Arreglos multidimensionales", @weeks[1], 1, '31.png'
create_day 7, "Funciones, programacion estructurada", @weeks[1], 1, '6.png'
create_day 8, "Practica de algoritmos", @weeks[1], 1, '30.png'
create_day 9, "Practica de algoritmos", @weeks[1], 1, '30.png'
create_day 10, "Entrega de proyecto y certificación", @weeks[1], 1, '3.png'

# *********************** SEMANA3 ***********************

create_day 11, "Ruby idiomatico 1", @weeks[2], 0, '26.png'
create_day 12, "Ruby idiomatico 2", @weeks[2], 0, '26.png'
create_day 13, "Clases y objetos en ruby", @weeks[2], 0, '26.png'
create_day 14, "Self, herencia y modulos", @weeks[2], 0, '26.png'
create_day 15, "Cardinalidad, diagrama de clase", @weeks[2], 0, '26.png'

# *********************** SEMANA 4 ***********************

create_day 16, "Ruby warriors, nija vs dinosaurios", @weeks[3], 0, '27.png'
create_day 17, "Intro a HTTP, REST, JSON", @weeks[3], 0, '27.png'
create_day 18, "Http Party, Consulta de API tokenless (Spotify).", @weeks[3], 0, '27.png'
create_day 19, "Http Party, Consulta de API tokenless (OMDB).", @weeks[3], 0, '17.png'
create_day 20, "Http Party, Consulta de API tokenless (GeoIp).", @weeks[3], 0, '18.png'

# *********************** SEMANA 5 ***********************

create_day 21, "Modelado de datos", @weeks[4], 0, '22.png'
create_day 22, "SQL 1", @weeks[4], 0, '23.png'
create_day 23, "SQL 2", @weeks[4], 0, '23.png'
create_day 24, "MVC, Frameworks, Rails", @weeks[4], 0, '32.png'
create_day 25, "Modelos en rails 1", @weeks[4], 0, '32.png'

# *********************** SEMANA 6 ***********************

create_day 26, "Modelos en rails 2", @weeks[5], 0, '32.png'
create_day 27, "Controladores en Rails 1", @weeks[5], 0, '19.png'
create_day 28, "Controladores en Rails 2", @weeks[5], 0, '32.png'
create_day 29, "Modelos + Controladores en Rails", @weeks[5], 0, '32.png'
create_day 30, "Servicios Web, CRUD en Rails", @weeks[5], 0, '33.png'

# *********************** SEMANA 7 ***********************

create_day 31, "[Review] Algoritmos basicos", @weeks[6], 0, '11.png'
create_day 32, "[Review] Algoritmos intermedio", @weeks[6], 0, '12.png'
create_day 33, "[Review] HTTP en ruby", @weeks[6], 0, '17.png'
create_day 34, "[Review] Modelado de una BD", @weeks[6], 0, '22.png'
create_day 35, "[Review] CRUD API en Rails", @weeks[6], 0, '33.png'

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

#create_challenge 'manana', 'Entrega Battleship', 'Enunciado de battleship', @categories[2], @days[12]

# *********************** PARAMETERS ***********************

create_parameter "current_week", "1"
create_parameter "promo_group", "Academia-Hack-Promo3"
create_parameter "github_promo_url", "https://github.com/Academia-Hack-Promo3/"
