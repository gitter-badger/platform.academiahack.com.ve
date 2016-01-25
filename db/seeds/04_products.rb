def create_product code, name, description, duration
  product = Product.new
  product.code = code
  product.name = name
  product.description = description
  product.duration = duration
  product.save
  product
end

create_product "001","HumanToDev", "Intensivo de programacion web", 70
create_product "002","Propedeutico HumanToDev", "Propedeutico de HTD", 10