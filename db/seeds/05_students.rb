def create_student name, last_name, email, identity, name_space_id=nil, password=nil
  user = User.new
  user.password = password ? password : identity
  if user.password.length >= 8
    user.email = email
    user.name = name
    user.last_name = last_name
    user.identity = identity
    user.name_space_id = name_space_id
    user.save
  else
    puts 'El password debe ser mayor a 8 caracteres'
  end
end

# *********************** PROMO 4 ***********************
create_student 'Emanuel', 'Gomez' ,'emanuel.gomez.9@gmail.com', '19163292'
create_student 'Jose', 'De Leon' ,'josedeleon_k@hotmail.com', '26194045'
create_student 'Jose', 'Rodriguez' ,'darkniguit@gmail.com', '20802029'
create_student 'Luis', 'Machillanda','nikko1801@gmail.com', '25206591'
create_student 'Niolberth', 'Rodriguez','rycerickz@hotmail.es', '24089142'
create_student 'Oscar', 'Martinez','oscar_martinez1992@live.com', '20616210'
create_student 'Roman', 'Fuentes','romangof@gmail.com', '20701132'
create_student 'Jose', 'Arismendi','a.2_19@hotmail.com', '20595385'

create_student 'Jorge', 'Moreno','jolumodu@outlook.com', '19690779'
create_student 'Jose', 'Rangel','josea.rangelg@gmail.com', '20921454'
create_student 'Juan', 'Calcagno','negro32@gmail.com', '20748827'
create_student 'Juilius', 'Indirago','julius_1008@hotmail.com', '21495021'
create_student 'Letty', 'Villamizar','leettyvillamizar@gmail.com', '20616607'
create_student 'Rosa', 'Garcia','rosairenegarcia@live.com', '06844879'
create_student 'Erick', 'Gonzalez','erick_fat@hotmail.com', '24272055'
create_student 'Carlos', 'Gonzalez','carloseduardogonzalezmendoza@gmail.com', '26597013'
create_student 'Gabriel', 'Brazzoduro','brazzoduro_14@hotmail.com', '25947926'
create_student 'Miguel', 'Brazzoduro','brazzoduro26@gmail.com ', '16543115'
# *********************** PROMO 4 ***********************

create_student 'Romer', 'Ramos','romerramos@gmail.com', '18020036'
