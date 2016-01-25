def create_mentor name, last_name, email, password, type_of=nil, identity=nil
  mentor = Mentor.new
  mentor.type_of = type_of

  user = User.new
  user.password = password ? password : identity
  if user.password.length >= 8
    user.email = email
    user.name = name
    user.last_name = last_name
    user.identity = identity

    mentor.user = user
    mentor.save
  else
    puts 'El password debe ser mayor a 8 caracteres'
  end
end
create_mentor 'Romer', 'Ramos','rramos@academiahack.com.ve', 'Hack2015', 'leader', '18020036'

create_mentor 'Daniel', 'Espinoza','despinoza@academiahack.com.ve', 'Hack2015', 'regular'
create_mentor 'Abraham', 'Gonzalez','agonzalez@academiahack.com.ve', 'Hack2015', 'regular'

create_mentor 'Oscar', 'Arocha','oarocha@academiahack.com.ve', 'Hack2015', 'freelancer'
create_mentor 'Juan', 'Manrique','jmanrique@academiahack.com.ve', 'Hack2015', 'freelancer'
create_mentor 'Angel', 'Alarcon','angelalarcon.aa@gmail.com', 'Hack2015', 'freelancer'

create_mentor 'Johana', 'Salazar','jsalazar@academiahack.com.ve', 'Hack2016', 'student_teaching'
create_mentor 'Daniel', 'Guzzo','dguzzo@academiahack.com.ve', 'Hack2016', 'student_teaching'