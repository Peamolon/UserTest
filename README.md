# README

Api de prueba para la obtenciòn y creacion de nuevos usuarios
Instrucciones de uso:

* clonar el repositorio usando git clone https://github.com/Peamolon/UserTest.git

* Para correr la tarea y llenar la base de datos con los datos de la API usamos el comando bin/rake namespace:update_dates

* Instalamos todas las gemas con bunlde install/ bundler 

* Nos movemos con cd a la carpeta llamada UserTest e iniciamos el rails s

* Para obtener todos los usuarios usaremos curl $curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/users'

* Para crear un usuario nuevo $curl -i -H "Content-Type:application/json" -X POST http://localhost:3000/api/users -d '{"first_name": "Javier", "email": "myemail@gmail.com", "last_name": "Lopez", "avatar": "myimage.jpg"}'

* Para la paginación usamos la url http://localhost:3000/api/users?page=#{number}

* La documentaciòn se encuentra en spec/integration/users_spec.rb



