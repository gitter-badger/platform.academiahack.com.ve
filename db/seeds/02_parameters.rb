promo4 = Promo.all.take

required_knowledge_template= "
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

cheatsheet_template = "
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

def create_parameter key, value
  param = Parameter.new
  param.key = key
  param.value = value
  param.save
end

create_parameter "current_promo", promo4.number
create_parameter "requirements_template", required_knowledge_template
create_parameter "cheatsheet_template", cheatsheet_template