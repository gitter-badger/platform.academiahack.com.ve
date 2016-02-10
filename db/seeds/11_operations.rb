def create_operation name, last_name, email, password, type_of=nil, identity=nil
  operation = Operation.new
  operation.type_of = type_of

  user = User.new
  user.password = password ? password : identity
  if user.password.length >= 8
    user.email = email
    user.name = name
    user.last_name = last_name
    user.identity = identity

    operation.user = user
    operation.save
  else
    puts 'El password debe ser mayor a 8 caracteres'
  end
end

create_operation 'Anais', 'Legonia','alegonia@academiahack.com.ve', 'Hack2015', 'leader'
create_operation 'Maria', 'Romero','mromero@academiahack.com.ve', 'Hack2015', 'support'
