prope_htd = Product.find_by code:'002'
htd = Product.find_by code:'001'

def create_week name, product=nil
  week = Week.new
  week.name = name
  week.product = product
  week.save
end

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