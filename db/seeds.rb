@weeks = []
@days = []
@categories = []
@challenges = []
@parameters = []
@students = []
@academic_schedules = []

@required_knowledge_template= "
Conocimientos previos
-----------------------------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris. Aliquam faucibus neque orci, quis dignissim ante aliquam nec. Integer hendrerit rutrum augue sit amet dictum. Suspendisse laoreet posuere diam, id iaculis ligula congue ut. Mauris elementum nisi fermentum neque ultrices, sed gravida dolor placerat. Proin sed sagittis dui, nec ornare risus. Vivamus neque leo, dapibus ut mollis vitae, imperdiet in lorem. Maecenas facilisis vehicula tellus, sed imperdiet elit sagittis a.


Paquetes y dependencias (Requerimientos)
------------------------------------------------------------------

- [Paquete 1](http://www.google.com)
- [Paquete 2](http://www.google.com)
- ``` sudo apt-get install package_name ```

Términos
---------------

- Término1: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris.

- Término2: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris.

- Término3: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris.

Links oficiales
----------------------

- [Link 1](http://www.google.com)
- [Link 2](http://www.google.com)
- [Link 3](http://www.google.com)

FAQ
------

#### Pregunta 1?
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris. Aliquam faucibus neque orci, quis dignissim ante aliquam nec. Integer hendrerit rutrum augue sit amet dictum. Suspendisse laoreet posuere diam, id iaculis ligula congue ut.

#### Pregunta 2?
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris. Aliquam faucibus neque orci, quis dignissim ante aliquam nec. Integer hendrerit rutrum augue sit amet dictum. Suspendisse laoreet posuere diam, id iaculis ligula congue ut.

#### Pregunta 3?
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris. Aliquam faucibus neque orci, quis dignissim ante aliquam nec. Integer hendrerit rutrum augue sit amet dictum. Suspendisse laoreet posuere diam, id iaculis ligula congue ut."

@cheatsheet_template = "
Tips
------
- tip1: Lorem ipsum dolor sit amet, consectetur adipiscing elit.

- tip2: Lorem ipsum dolor sit amet, consectetur adipiscing elit.

- tip3: Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Resumen
---------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed felis sed elit ultricies efficitur eget sit amet mauris. Aliquam faucibus neque orci, quis dignissim ante aliquam nec.

Código
----------

~~~ ruby
  def hello_world
    puts 'Hola mundo'
  end
~~~"

def create_week name, product=nil
  week = Week.new
  week.name = name
  week.product = product
  week.save
  @weeks.push week
end

def create_day position, name, week, image = '0.png', product=nil, required_knowledge=nil, cheatsheet=nil
  day = Day.new
  day.name = name
  day.position = position
  day.image = File.new("#{Rails.root}/app/assets/images/#{image}")
  day.week = week
  day.product = product
  day.required_knowledge = required_knowledge
  day.cheatsheet = cheatsheet
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

def create_mentor name, last_name, email, password, type_of=nil, identity=nil
  mentor = Mentor.new
  mentor.identity = identity
  mentor.type_of = type_of

  user = create_user name, last_name, email, password, User
  mentor.user = user
  mentor.save
end

def create_user name, last_name, email, password, devise_class, gitlab_user=nil, name_space_id=nil
  user = devise_class.new
  user.email = email
  if password.length >= 8
    if devise_class.name == "User"
      user.name = name
      user.last_name = last_name
      if gitlab_user != nil
        user.gitlab_user = gitlab_user
        user.name_space_id = name_space_id
        @students.push user
      end
    end
    user.password = password
    user if user.save
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

def create_academic_week_schedule promo, week, position=nil
  current_promo_day = 1
  academic_week_schedule = AcademicWeekSchedule.create({position: position, promo_id: promo.id, week_id: week.id})
  days = Day.where(week: week).order(:number)

  days.each do |day|
    AcademicDaySchedule.create({number: ((position-1) * 5) + current_promo_day, day_id: day.id, academic_week_schedule_id: academic_week_schedule.id, status: 1})
    current_promo_day += 1
  end
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

# *********************** PROPEDEUTICO ***********************
create_week "Algoritmos en ruby 1", prope_htd
create_week "Algoritmos en ruby 2", prope_htd
# ******************** PROPEDEUTICO ***********************
# ******************** BACKEND ***********************
create_week "Ruby idiomatico + objetos en ruby", htd
create_week "Objetos en ruby + HTTP", htd
create_week "BD + Rails", htd
create_week "Rails + ActiveRecord", htd
create_week "Controllers + JSON Response", htd
# *********************** BACKEND ***********************
# *********************** FRONTEND ***********************
create_week "HTML + CSS", htd
create_week "Bootstrap", htd
create_week "Javascript", htd
create_week "jQuery", htd
create_week "FrontEnd Tools", htd
create_week "AngularJS", htd
create_week "Full stack app", htd
# *********************** FRONTEND ***********************
# *********************** FINAL HACK ***********************
create_week "Proyecto Final", htd
create_week "Proyecto Final", htd
# *********************** FINAL HACK ***********************

# *********************** SEMANA1 ***********************
create_day 1, "Linux, terminal, usuarios, VM", @weeks[0], '16.png'
create_day 2, "Busquedas, vcs, git, github", @weeks[0], '19.png'
create_day 3, "Variables, tipos de dato, estructura de control", @weeks[0], '11.png'
create_day 4, "Estructuras iterativas, arreglos", @weeks[0], '12.png'
create_day 5, "Arreglos, ordenamiento basico", @weeks[0], '13.png'

# *********************** SEMANA2 ***********************

create_day 1, "Arreglos multidimensionales", @weeks[1], '31.png'
create_day 2, "Funciones, programacion estructurada", @weeks[1], '6.png'
create_day 3, "Practica de algoritmos", @weeks[1], '30.png'
create_day 4, "Practica de algoritmos", @weeks[1], '30.png'
create_day 5, "Entrega de proyecto y certificación", @weeks[1], '3.png'

# *********************** SEMANA3 ***********************

create_day 1, "Ruby idiomatico 1", @weeks[2], '26.png'
create_day 2, "Ruby idiomatico 2", @weeks[2], '26.png'
create_day 3, "Clases y objetos en ruby", @weeks[2], '27.png'
create_day 4, "Self, herencia y modulos", @weeks[2], '27.png'
create_day 5, "Cardinalidad, diagrama de clase", @weeks[2], '22.png'

# *********************** SEMANA 4 ***********************

create_day 1, "Ruby warriors, ninja vs dinosaurios", @weeks[3], '27.png'
create_day 2, "Intro a HTTP, REST, JSON", @weeks[3], '40.png'
create_day 3, "Http Party, Consulta de API tokenless (Spotify).", @weeks[3], '17.png'
create_day 4, "Http Party, Consulta de API tokenless (OMDB).", @weeks[3], '17.png'
create_day 5, "Http Party, Consulta de API tokenless (GeoIp).", @weeks[3], '17.png'

# *********************** SEMANA 5 ***********************

create_day 1, "Modelado de datos", @weeks[4], '22.png'
create_day 2, "SQL 1", @weeks[4], '23.png'
create_day 3, "SQL 2", @weeks[4], '23.png'
create_day 4, "MVC, Frameworks, Rails", @weeks[4], '32.png'
create_day 5, "ORM + ActiveRecord", @weeks[4], '32.png'

# *********************** SEMANA 6 ***********************

create_day 1, "ActiveRecord relaciones, validaciones", @weeks[5], '32.png'
create_day 2, "ActiveRecord queries, callbacks", @weeks[5], '3.png'
create_day 3, "ActiveRecord queries", @weeks[5], '3.png'
create_day 4, "Modelado + SQL + ORM 1", @weeks[5], '25.png'
create_day 5, "Modelado + SQL + ORM 2", @weeks[5], '25.png'

# *********************** SEMANA 7 ***********************

create_day 1, "Rails routes + controllers", @weeks[6], '32.png'
create_day 2, "Rails controllers", @weeks[6], '32.png'
create_day 3, "Postman + Rails 1", @weeks[6], '18.png'
create_day 4, "Postman + Rails 2", @weeks[6], '18.png'
create_day 5, "API Cines", @weeks[6], '2.png'

# *********************** SEMANA 8 ***********************

create_day 1, "Lunes", @weeks[7]
create_day 2, "Martes", @weeks[7]
create_day 3, "Miercoles", @weeks[7]
create_day 4, "Jueves", @weeks[7]
create_day 5, "Viernes", @weeks[7]

# *********************** SEMANA 9 ***********************

create_day 1, "Lunes", @weeks[8]
create_day 2, "Martes", @weeks[8]
create_day 3, "Miercoles", @weeks[8]
create_day 4, "Jueves", @weeks[8]
create_day 5, "Viernes", @weeks[8]

# *********************** SEMANA 10 ***********************

create_day 1, "Lunes", @weeks[9]
create_day 2, "Martes", @weeks[9]
create_day 3, "Miercoles", @weeks[9]
create_day 4, "Jueves", @weeks[9]
create_day 5, "Viernes", @weeks[9]

# *********************** SEMANA 11 ***********************

create_day 1, "Lunes", @weeks[10]
create_day 2, "Martes", @weeks[10]
create_day 3, "Miercoles", @weeks[10]
create_day 4, "Jueves", @weeks[10]
create_day 5, "Viernes", @weeks[10]

# *********************** SEMANA 12 ***********************

create_day 1, "Lunes", @weeks[11]
create_day 2, "Martes", @weeks[11]
create_day 3, "Miercoles", @weeks[11]
create_day 4, "Jueves", @weeks[11]
create_day 5, "Viernes", @weeks[11]

# *********************** SEMANA 13 ***********************

create_day 1, "Lunes", @weeks[12]
create_day 2, "Martes", @weeks[12]
create_day 3, "Miercoles", @weeks[12]
create_day 4, "Jueves", @weeks[12]
create_day 5, "Viernes", @weeks[12]

# *********************** SEMANA 14 ***********************

create_day 1, "Lunes", @weeks[13]
create_day 2, "Martes", @weeks[13]
create_day 3, "Miercoles", @weeks[13]
create_day 4, "Jueves", @weeks[13]
create_day 5, "Viernes", @weeks[13]

# *********************** SEMANA 15 ***********************

create_day 1, "Lunes", @weeks[14]
create_day 2, "Martes", @weeks[14]
create_day 3, "Miercoles", @weeks[14]
create_day 4, "Jueves", @weeks[14]
create_day 5, "Viernes", @weeks[14]

# *********************** SEMANA 16 ***********************

create_day 1, "Lunes", @weeks[15]
create_day 2, "Martes", @weeks[15]
create_day 3, "Miercoles", @weeks[15]
create_day 4, "Jueves", @weeks[15]
create_day 5, "Viernes", @weeks[15]

# *********************************************************

create_category "Analisis", 'analisis.png'
create_category "Diseño", 'design.png'
create_category "Construccion", 'construct.png'
create_category "Bug", 'bug.png'

# *********************** CHALLENGES ***********************

#create_challenge 'manana', 'Entrega Battleship', 'Enunciado de battleship', @categories[2], @days[12]

# *********************** PARAMETERS ***********************

create_parameter "current_promo", promo4.number

create_parameter "requirements_template", @required_knowledge_template
create_parameter "cheatsheet_template", @cheatsheet_template

@weeks.each_with_index do |week, index|
  create_academic_week_schedule promo4, week, index+1
end

AcademicWeekSchedule.calculate_htd

create_mentor 'Romer', 'Ramos','rramos@academiahack.com.ve', 'Hack2015', 'leader', '18020036'

create_mentor 'Daniel', 'Espinoza','despinoza@academiahack.com.ve', 'Hack2015', 'regular'
create_mentor 'Abraham', 'Gonzalez','agonzalez@academiahack.com.ve', 'Hack2015', 'regular'

create_mentor 'Oscar', 'Arocha','oarocha@academiahack.com.ve', 'Hack2015', 'freelancer'
create_mentor 'Juan', 'Manrique','jmanrique@academiahack.com.ve', 'Hack2015', 'freelancer'
create_mentor 'Angel', 'Alarcon','angelalarcon.aa@gmail.com', 'Hack2015', 'freelancer'

create_mentor 'Johana', 'Salazar','jsalazar@academiahack.com.ve', 'Hack2016', 'student_teaching'
create_mentor 'Daniel', 'Guzzo','dguzzo@academiahack.com.ve', 'Hack2016', 'student_teaching'

create_user 'Hack', 'Admin', 'admin@academiahack.com.ve', 'Hack2015', AdminUser