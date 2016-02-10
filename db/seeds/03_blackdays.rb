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

# Retraso propedeutico
Date.new(2015, 11, 2).upto(Date.new(2015, 11, 6)) do |prope_date|
  create_black_day "Retraso propedeutico", "Debido a la puerta de la unexpo este dia no se pudo dar clase!", nil, nil, prope_date
end

# Retraso academico?
Date.new(2015, 11, 26).upto(Date.new(2015, 12, 7)) do |date|
  create_black_day "Retraso academico", "Debido a ser la ultima semana del anio se decidio no dar clase de rails sino dejarlo para el anio que viene", nil, nil, date
end

# Pausa navidenia 2015
Date.new(2015, 12, 10).upto(Date.new(2016, 1, 9)) do |date|
  create_black_day "Pausa navidenia", "navidad", nil, nil, date
end

# Carnaval 2016
Date.new(2016, 2, 8).upto(Date.new(2016, 2, 9)) do |date|
  create_black_day "Carnaval", "carnaval", nil, nil, date
end

# Semana Santa 2016
Date.new(2016, 3, 21).upto(Date.new(2016, 3, 25)) do |date|
  create_black_day "Semana Santa", "Semana Santa", nil, nil, date
end