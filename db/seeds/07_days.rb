weeks = Week.all

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
end

# *********************** SEMANA1 ***********************
create_day 1, "Busquedas, linux, terminal 1", weeks[0], '16.png'
create_day 2, "Terminal 2, algoritmos", weeks[0], '19.png'
create_day 3, "Variables, tipos de dato, estructura de control", weeks[0], '11.png'
create_day 4, "Estructuras iterativas, arreglos", weeks[0], '12.png'
create_day 5, "Arreglos, ordenamiento basico", weeks[0], '13.png'

# *********************** SEMANA2 ***********************

create_day 1, "Arreglos multidimensionales", weeks[1], '31.png'
create_day 2, "Funciones, programacion estructurada", weeks[1], '6.png'
create_day 3, "Practica de algoritmos", weeks[1], '30.png'
create_day 4, "Practica de algoritmos", weeks[1], '30.png'
create_day 5, "Entrega de proyecto y certificación", weeks[1], '3.png'

# *********************** SEMANA3 ***********************

create_day 1, "Ruby idiomatico 1", weeks[2], '26.png'
create_day 2, "Ruby idiomatico 2", weeks[2], '26.png'
create_day 3, "Clases y objetos en ruby", weeks[2], '27.png'
create_day 4, "Self, herencia y modulos", weeks[2], '27.png'
create_day 5, "Cardinalidad, diagrama de clase", weeks[2], '22.png'

# *********************** SEMANA 4 ***********************

create_day 1, "Ruby warriors, ninja vs dinosaurios", weeks[3], '27.png'
create_day 2, "Intro a HTTP, REST, JSON", weeks[3], '40.png'
create_day 3, "Http Party, Consulta de API tokenless (Spotify).", weeks[3], '17.png'
create_day 4, "Http Party, Consulta de API tokenless (OMDB).", weeks[3], '17.png'
create_day 5, "Http Party, Consulta de API tokenless (GeoIp).", weeks[3], '17.png'

# *********************** SEMANA 5 ***********************

create_day 1, "Modelado de datos", weeks[4], '22.png'
create_day 2, "SQL 1", weeks[4], '23.png'
create_day 3, "SQL 2", weeks[4], '23.png'
create_day 4, "MVC, Frameworks, Rails", weeks[4], '32.png'
create_day 5, "ORM + ActiveRecord", weeks[4], '32.png'

# *********************** SEMANA 6 ***********************

create_day 1, "ActiveRecord relaciones, validaciones", weeks[5], '32.png'
create_day 2, "ActiveRecord queries, callbacks", weeks[5], '3.png'
create_day 3, "ActiveRecord queries", weeks[5], '3.png'
create_day 4, "Modelado + SQL + ORM 1", weeks[5], '25.png'
create_day 5, "Modelado + SQL + ORM 2", weeks[5], '25.png'

# *********************** SEMANA 7 ***********************

create_day 1, "Rails routes + controllers", weeks[6], '32.png'
create_day 2, "Rails controllers", weeks[6], '32.png'
create_day 3, "Postman + Rails 1", weeks[6], '18.png'
create_day 4, "Postman + Rails 2", weeks[6], '18.png'
create_day 5, "API Cines", weeks[6], '2.png'

# *********************** SEMANA 8 ***********************

create_day 1, "Lunes", weeks[7]
create_day 2, "Martes", weeks[7]
create_day 3, "Miercoles", weeks[7]
create_day 4, "Jueves", weeks[7]
create_day 5, "Viernes", weeks[7]

# *********************** SEMANA 9 ***********************

create_day 1, "Lunes", weeks[8]
create_day 2, "Martes", weeks[8]
create_day 3, "Miercoles", weeks[8]
create_day 4, "Jueves", weeks[8]
create_day 5, "Viernes", weeks[8]

# *********************** SEMANA 10 ***********************

create_day 1, "Lunes", weeks[9]
create_day 2, "Martes", weeks[9]
create_day 3, "Miercoles", weeks[9]
create_day 4, "Jueves", weeks[9]
create_day 5, "Viernes", weeks[9]

# *********************** SEMANA 11 ***********************

create_day 1, "Lunes", weeks[10]
create_day 2, "Martes", weeks[10]
create_day 3, "Miercoles", weeks[10]
create_day 4, "Jueves", weeks[10]
create_day 5, "Viernes", weeks[10]

# *********************** SEMANA 12 ***********************

create_day 1, "Lunes", weeks[11]
create_day 2, "Martes", weeks[11]
create_day 3, "Miercoles", weeks[11]
create_day 4, "Jueves", weeks[11]
create_day 5, "Viernes", weeks[11]

# *********************** SEMANA 13 ***********************

create_day 1, "Lunes", weeks[12]
create_day 2, "Martes", weeks[12]
create_day 3, "Miercoles", weeks[12]
create_day 4, "Jueves", weeks[12]
create_day 5, "Viernes", weeks[12]

# *********************** SEMANA 14 ***********************

create_day 1, "Lunes", weeks[13]
create_day 2, "Martes", weeks[13]
create_day 3, "Miercoles", weeks[13]
create_day 4, "Jueves", weeks[13]
create_day 5, "Viernes", weeks[13]

# *********************** SEMANA 15 ***********************

create_day 1, "Lunes", weeks[14]
create_day 2, "Martes", weeks[14]
create_day 3, "Miercoles", weeks[14]
create_day 4, "Jueves", weeks[14]
create_day 5, "Viernes", weeks[14]

# *********************** SEMANA 16 ***********************

create_day 1, "Lunes", weeks[15]
create_day 2, "Martes", weeks[15]
create_day 3, "Miercoles", weeks[15]
create_day 4, "Jueves", weeks[15]
create_day 5, "Viernes", weeks[15]

# *********************************************************