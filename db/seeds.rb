@weeks = []
@days = []
@categories = []
@challenges = []
@parameters = []
@students = []
@academic_schedules = []


def create_week number, name, position, product=nil
  week = Week.new
  week.number = number
  week.name = name
  week.position = position
  week.product = product
  week.save
  @weeks.push week
end

def create_day number, name, week, status, image = '0.png', product=nil
  day = Day.new
  day.number = number
  day.name = name
  day.image = File.new("#{Rails.root}/app/assets/images/#{image}")
  day.week = week
  day.status = status
  day.product = product
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

def create_user name, last_name, email, password, devise_class, gitlab_user=nil, name_space_id=nil
  user = devise_class.new
  user.email = email
  if password.length >= 8
    if gitlab_user != nil
      user.name = name
      user.last_name = last_name
      user.gitlab_user = gitlab_user
      user.name_space_id = name_space_id
      @students.push user
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

def create_youtube_video name, youtube_url, day
  video = Video.new
  video.name = name
  video.url = youtube_url
  video.save
  day.videos.push video
end

def create_promo number, git_url, git_group, start_date, name=nil
  promo = Promo.new
  promo.number = number
  promo.git_url = git_url
  promo.git_group = git_group
  promo.start_date = start_date
  promo.name = name
  promo.save
  promo
end

def create_product code, name, description, duration
  product = Product.new
  product.code = code
  product.name = name
  product.description = description
  product.duration = duration
  product.save
  product
end

def create_enrollment promo, product, user
  enrollment = Enrollment.new
  enrollment.promo = promo
  enrollment.product = product
  enrollment.user = user
  enrollment.save
  enrollment
end

def create_black_day name, description, day=nil, month=nil, black_date=nil
  black_day = BlackDay.new
  black_day.name = name
  black_day.description = description
  black_day.day = day
  black_day.month = month
  black_day.black_date = black_date
  black_day.save
  black_day
end

create_user 'Mentores', 'Hack' ,'mentores@academiahack.com.ve', 'Hack2015', User
create_user 'Romer', 'Ramos','romerramos@gmail.com', '18020036', User, 'romerramos', '228413'

htd = create_product "001","HumanToDev", "Intensivo de programacion web", 70
prope_htd = create_product "002","Propedeutico HumanToDev", "Propedeutico de HTD", 10

# *********************** BLACKDAYS ***********************
# Retraso propedeutico
Date.new(2015, 11, 2).upto(Date.new(2015, 11, 6)) do |prope_date|
  create_black_day "Retraso propedeutico", "Debido a la puerta de la unexpo este dia no se pudo dar clase!", nil, nil, prope_date
end

# Retraso academico?
Date.new(2015, 11, 26).upto(Date.new(2015, 12, 7)) do |date|
  create_black_day "Retraso academico", "Debido a ser la ultima semana del anio se decidio no dar clase de rails sino dejarlo para el anio que viene", nil, nil, date
end

# Pausa navidenia
Date.new(2015, 12, 8).upto(Date.new(2016, 1, 9)) do |date|
  create_black_day "Pausa navidenia", "navidad", nil, nil, date
end

# *********************** BLACKDAYS ***********************

# *********************** PROMO 4 ***********************
promo4 = create_promo 4, "gitlab.com/HackPromo4", "HackPromo4", Date.new(2015, 10, 19), "Promo 4"

create_user 'Emanuel', 'Gomez' ,'emanuel.gomez.9@gmail.com', '19163292', User, 'egomez292', '332654'
create_user 'Jose', 'De Leon' ,'josedeleon_k@hotmail.com', '26194045', User, 'jleon045', '332683'
create_user 'Jose', 'Rodriguez' ,'darkniguit@gmail.com', '20802029', User, 'jrodriguez029', '332689'
create_user 'Luis', 'Machillanda','nikko1801@gmail.com', '25206591', User, 'lmachillanda591', '332692'
create_user 'Niolberth', 'Rodriguez','rycerickz@hotmail.es', '24089142', User, 'nrodriguez142', '332695'
create_user 'Oscar', 'Martinez','oscar_martinez1992@live.com', '20616210', User, 'omartinez210', '332697'
create_user 'Roman', 'Fuentes','romangof@gmail.com', '20701132', User, 'rfuentes132', '332699'
create_user 'Jose', 'Arismendi','a.2_19@hotmail.com', '20595385', User, 'jarismendi385', '332905'

create_user 'Jorge', 'Moreno','jolumodu@outlook.com', '19690779', User, 'jmoreno779', '332783'
create_user 'Jose', 'Rangel','josea.rangelg@gmail.com', '20921454', User, 'jrangel454', '332788'
create_user 'Juan', 'Calcagno','negro32@gmail.com', '20748827', User, 'jcalcagno827', '332909'
create_user 'Juilius', 'Indirago','julius_1008@hotmail.com', '21495021', User, 'jindirago021', '332915'
create_user 'Letty', 'Villamizar','leettyvillamizar@gmail.com', '20616607', User, 'lvillamizar607', '332917'
create_user 'Rosa', 'Garcia','rosairenegarcia@live.com', '06844879', User, 'rgarcia879', '332924'
create_user 'Erick', 'Gonzalez','erick_fat@hotmail.com', '24272055', User, 'egonzalez055', '332941'
create_user 'Carlos', 'Gonzalez','carloseduardogonzalezmendoza@gmail.com', '26597013', User, 'cgonzalez013', '410046'
create_user 'Gabriel', 'Brazzoduro','brazzoduro_14@hotmail.com', '25947926', User, 'gbrazzoduro926', '332943'
create_user 'Miguel', 'Brazzoduro','brazzoduro26@gmail.com ', '16543115', User, 'mbrazzoduro115', '332945'
# *********************** PROMO 4 ***********************

# *********************** ENROLLMENT PROMO 4 ***********************
@students.each do |student|
  create_enrollment promo4, prope_htd, student
  create_enrollment promo4, htd, student
end
# *********************** ENROLLMENT PROMO 4 ***********************

create_user 'Romer', 'Ramos','rramos@academiahack.com.ve', 'Hack2015', AdminUser
create_user 'Oscar', 'Arocha','oarocha@academiahack.com.ve', 'Hack2015', AdminUser
create_user 'Daniel', 'Espinoza','despinoza@academiahack.com.ve', 'Hack2015', AdminUser
create_user 'Abraham', 'Gonzalez','agonzalez@academiahack.com.ve', 'Hack2015', AdminUser
create_user 'Juan', 'Manrique','jmanrique@academiahack.com.ve', 'Hack2015', AdminUser
create_user 'Anais', 'Legonia','alegonia@academiahack.com.ve', 'Hack2015', AdminUser
create_user 'Jorge', 'Fuentes','jfuentes@academiahack.com.ve', 'Hack2015', AdminUser

# *********************** PROPEDEUTICO ***********************
create_week 1, "Algoritmos en ruby 1", 1, prope_htd
create_week 2, "Algoritmos en ruby 2", 2, prope_htd
# *********************** PROPEDEUTICO ***********************
# *********************** BACKEND ***********************
create_week 3, "Ruby idiomatico + objetos en ruby", 3, htd
create_week 4, "Objetos en ruby + HTTP", 4, htd
create_week 5, "BD + Rails", 5, htd
create_week 6, "Rails + ActiveRecord", 6, htd
create_week 7, "Controllers + JSON Response", 7, htd
# *********************** BACKEND ***********************
# *********************** FRONTEND ***********************
create_week 8, "HTML + CSS", 8, htd
create_week 9, "Bootstrap", 9, htd
create_week 10, "Javascript", 10, htd
create_week 11, "jQuery", 11, htd
create_week 12, "FrontEnd Tools", 12, htd
create_week 13, "AngularJS", 13, htd
create_week 14, "Full stack app", 14, htd
# *********************** FRONTEND ***********************
# *********************** FINAL HACK ***********************
create_week 15, "Proyecto Final", 15, htd
create_week 16, "Proyecto Final", 16, htd
# *********************** FINAL HACK ***********************

# *********************** SEMANA1 ***********************
create_day 1, "Linux, terminal, usuarios, VM", @weeks[0], 2, '16.png'
create_day 2, "Busquedas, vcs, git, github", @weeks[0], 2, '19.png'
create_day 3, "Variables, tipos de dato, estructura de control", @weeks[0], 2, '11.png'
create_day 4, "Estructuras iterativas, arreglos", @weeks[0], 2, '12.png'
create_day 5, "Arreglos, ordenamiento basico", @weeks[0], 2, '13.png'

# *********************** SEMANA2 ***********************

create_day 6, "Arreglos multidimensionales", @weeks[1], 2, '31.png'
create_day 7, "Funciones, programacion estructurada", @weeks[1], 2, '6.png'
create_day 8, "Practica de algoritmos", @weeks[1], 2, '30.png'
create_day 9, "Practica de algoritmos", @weeks[1], 2, '30.png'
create_day 10, "Entrega de proyecto y certificación", @weeks[1], 2, '3.png'

# *********************** SEMANA3 ***********************

create_day 11, "Ruby idiomatico 1", @weeks[2], 2, '26.png'
create_day 12, "Ruby idiomatico 2", @weeks[2], 2, '26.png'
create_day 13, "Clases y objetos en ruby", @weeks[2], 2, '27.png'
create_day 14, "Self, herencia y modulos", @weeks[2], 2, '27.png'
create_day 15, "Cardinalidad, diagrama de clase", @weeks[2], 2, '22.png'

# *********************** SEMANA 4 ***********************

create_day 16, "Ruby warriors, ninja vs dinosaurios", @weeks[3], 2, '27.png'
create_day 17, "Intro a HTTP, REST, JSON", @weeks[3], 2, '40.png'
create_day 18, "Http Party, Consulta de API tokenless (Spotify).", @weeks[3], 2, '17.png'
create_day 19, "Http Party, Consulta de API tokenless (OMDB).", @weeks[3], 2, '17.png'
create_day 20, "Http Party, Consulta de API tokenless (GeoIp).", @weeks[3], 2, '17.png'

# *********************** SEMANA 5 ***********************

create_day 21, "Modelado de datos", @weeks[4], 1, '22.png'
create_day 22, "SQL 1", @weeks[4], 1, '23.png'
create_day 23, "SQL 2", @weeks[4], 1, '23.png'
create_day 24, "MVC, Frameworks, Rails", @weeks[4], 1, '32.png'
create_day 25, "ORM + ActiveRecord", @weeks[4], 1, '32.png'

# *********************** SEMANA 6 ***********************

create_day 26, "ActiveRecord relaciones, validaciones", @weeks[5], 0, '32.png'
create_day 27, "ActiveRecord queries, callbacks", @weeks[5], 0, '3.png'
create_day 28, "ActiveRecord queries", @weeks[5], 0, '3.png'
create_day 29, "Modelado + SQL + ORM 1", @weeks[5], 0, '25.png'
create_day 30, "Modelado + SQL + ORM 2", @weeks[5], 0, '25.png'

# *********************** SEMANA 7 ***********************

create_day 31, "Rails routes + controllers", @weeks[6], 0, '32.png'
create_day 32, "Rails controllers", @weeks[6], 0, '32.png'
create_day 33, "Postman + Rails 1", @weeks[6], 0, '18.png'
create_day 34, "Postman + Rails 2", @weeks[6], 0, '18.png'
create_day 35, "API Cines", @weeks[6], 0, '2.png'

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

# *********************** SEMANA 15 ***********************

create_day 71, "Lunes", @weeks[14], 0
create_day 72, "Martes", @weeks[14], 0
create_day 73, "Miercoles", @weeks[14], 0
create_day 74, "Jueves", @weeks[14], 0
create_day 75, "Viernes", @weeks[14], 0

# *********************** SEMANA 16 ***********************

create_day 76, "Lunes", @weeks[15], 0
create_day 77, "Martes", @weeks[15], 0
create_day 78, "Miercoles", @weeks[15], 0
create_day 79, "Jueves", @weeks[15], 0
create_day 80, "Viernes", @weeks[15], 0

# *********************************************************

create_category "Analisis", 'analisis.png'
create_category "Diseño", 'design.png'
create_category "Construccion", 'construct.png'
create_category "Bug", 'bug.png'

# *********************** CHALLENGES ***********************

#create_challenge 'manana', 'Entrega Battleship', 'Enunciado de battleship', @categories[2], @days[12]

# *********************** PARAMETERS ***********************

create_parameter "current_promo", promo4.number

@weeks.each_with_index do |week, index|
  AcademicWeekSchedule.generate promo4, week, index+1
end

AcademicWeekSchedule.calculate_htd

