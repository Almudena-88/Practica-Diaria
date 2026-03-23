# Plan de aprendizaje Prácticas 2026 

## ·Docker: conceptos como contenedores, imágenes, redes, volúmenes y Docker Compose

### Levantar un entorno de práctica con Docker Compose:

    version: "3.9"
    services:
      app:
       image: python:3.12
       container_name: practica_app
       volumes:
       - ./src:/app
       working_dir: /app
       command: tail -f /dev/null  # Mantiene el contenedor corriendo
       ports:
       - "8000:8000"
       environment:
       - PYTHONUNBUFFERED=1
       depends_on:
      - db

      db:
       image: postgres:16
       container_name: practica_db
       environment:
       POSTGRES_USER: user
       POSTGRES_PASSWORD: password
       POSTGRES_DB: practica
       ports:
       - "5432:5432"
       volumes:
      - db_data:/var/lib/postgresql/data

     volumes:
      db_data:

### Comandos de uso diario:

#### - Consultar imágenes descargadas:
    docker images

#### - Descargar imágenes:
    docker pull nombre_imagen

#### - Descargar versión específica de la imagen (**Docker Hub Container Image Library**):
    docker pull nombre_imagen:versión_imagen

#### - Eliminar imágenes:
    docker image rm nombre_imagen

#### - Ejecutar un contenedor por el nombre:
    docker start nombre_contenedor

#### - Ejecutar un contenedor por el ID (El ID lo devuelve *docker create* o *docker ps*):
    docker start id_contenedor 

#### - Crear un contenedor en base a la imagen (Crea el contenedor pero no lo arranca):
    docker create nombre_imagen  

#### - Crear un contenedor (si no se descargó la imagen, la descarga, crea un contenedor y lo inicia)  
    docker run nombre_imagen

####  - Crear un contenedor con nombre del contenedor e imagen y puertos:
    docker run --name nombre_contenedor -p puerto_host:puerto_contenedor -d nombre_imagen

#### - Contruir una imagen a partir de un archivo Dockerfile
    docker build nombre_imagen   

#### - Levantar contenedores definidos en **docker-compose-yml** y vincularlos automáticamente a una red:
    docker compose up

   ##### -Levantar contenedores en segundo plano
    docker compose up -d (-d para ejecutar el segundo plano y que no bloquee la terminal)

   #### - Detener y eliminar los contenedores    
    docker compose down

   #### - Construir imágenes
    docker compose build 

   #### - Resetear la contraseña (Portainer) 
    docker container stop portainer
    docker run --rm -v portainer_data:/data portainer/helper-reset-password
    docker container start portainer

 ## ·Git
 
   ### Definir nombre de usuario y correo 
     git config --global user.name "Nombre" 
     git config --global user.email "nombre@correo.com"
 
   ### Inicializar el repositorio desde la carpeta del proyecto en el Editor
     git init

   ### Trabajar sobre la rama principal, añadiendo archivos y almacenar los cambios temporalmente (stage) y guardarlos
     git add nombre_archivo
     git commit -m "Comentario del commit"

   ### Crear nuevas ramas 
     git branch nombre-rama

   ### Unificar el trabajo de varias ramas en la principal
     git merge nombre-rama

   ### Crear nuevas ramas sobre las que trabajar paralelamente de forma temporal antes de fusionarla a la principal
     feature branch: 
     git switch -c segunda-rama 
     touch archivo.py

   ###  Mover commits de una rama a la principal cuando se quiere mantener el historial limpio y lineal de commits

  #### rebase: 

     git switch -c segunda-rama
     touch archivo1.py
     git add archivo1.py
     git commit -m "Comentario"
     touch archivo2.py
     git add archivo2.py
     git commit -m "Comentario"    
     git rebase master

  ### PR Simulada
     git log master..rama - Para enseñar comandos que están en "rama" y no en el master
     git diff master..rama - Enseña las diferencias entre las ramas

   ### PR Con Commits
     git init
     touch archivo1.py
     git add archivo1.py
     git commit -m "Primer mensaje"
     git add archivo1.py
     git commit -m "Segundo mensaje"
     git add archivo1.py
     git commit -m "Tercer mensaje"

   ### PR Squash
     git switch -c segunda 
     touch archivo2.py
     git add archivo2.py 
     git commit -m "Otro mensaje"
     git add archivo2.py
     git commit -m "Se añade otro mensaje" 
     git add archivo2.py
     git commit -m "Se añade el último mensaje"
     git switch master
     git merge --squash segunda
     git commit

    *Añadida esta práctica al repositorio "PR-Squash y Commits"


   

## ·Extensiones Visual Studio Code
 
 ### Linters
  Markdownlint: Analiza la sintaxis de los archivos markdown
  ESLint: Para detectar errores y forzar normas de estilo en JS/TS y encontrar problemas antes de ejecutar test

 ### Debug
  Python Debugger

 ## Mapa técnico del stack 

  ### Runtime
  Entorno donde se ejecuta código. Es el software que necesita el código para poder ser ejecutado.

  - Proporciona soporte al programa
  - Gestiona la memoria, hilos y componentes
  - Ejecuta código

  ### Framework 
  Conjunto estandar de conceptos, prácticas y herramientas predefinidas que actúan como plantilla que estructura el proyecto como un marco de trabajo.

  - Define cómo organizar el código y los archivos
  - Incluye librerías y componentes reutilizables 

  ### Base de datos
  Conjunto de datos estructurados, almacendos en un sistema informático que permite recopilar, gestionar, consultar y actualizar datos de forma rápida, segura y eficiente.

  - Persistencia de datos
  - Integridad de los datos 
  - Consultas complejas 

  ### Mensajería
  Mecanismo de comunicación asíncrona para intercambiar información sin estar conectados en tiempo real 
  
  - Paso de mensajes 
  - La aplicacón puede seguir funcionado incluso si el receptor no está listo, ya que los mensajes se  
   almacenan en colas de espera

  ### Front-End
  Es la parte de la web o aplicación con la que el usuario interactúa directamente. 

  - Se encarga de la parte que responde a las acciones del usuario, incluyendo: diseño, estructura, textos, imágenes, colores, botones y menús de navegación 
  - Garantiza que la navegación sea intuitiva y funcional

  ### Flujo de entrega

  1. El usuario hace click en el front-end
  2. Front-end hace una petición HTTP al backend
  3. Front-end procesa la petición 
  4. Backend hace una consulta a la BD
  5. Se devuelve la respuesta en formato JSON
  6. Front-end renderiza los datos


  ## ·Knex

  ### Instalación Knex:

  1· Con **Node.js** y **npm** instalados, a continuación se instala **Knex**:

    npm install knex 
  2· Se instala el cliente de la base de datos con la que se va a trabajar:

     - Postgres: npm instal pg
     - MySQL:    npm install mysql
     - SQLLite3: npm instal sqlite3 

  3· Se inicializa **Knex**:

      npx knex init

      *En este paso se crea knexfile.js donde se define la configuración de la(s) base(s) de datos*

  4· A continuación de crea el archivo **db.js** donde se  importa la biblioteca Knex, el fichero de configuración **knexfile.js** y se escoge el entorno de configuración para después inicializar **Knex** con dicha configuración.
  Este fichero se puede exportar luego al resto de Scripts  

  ### Comandos migraciones en Knex:

  Para crear un nuevo archivo en el directorio migrations:
     
     pnx knex migrate:make nombreMigración

  Para ejecutar todas las migraciones:

     npx knex migrate:latest

  Para ejecutar una migración en concreto:

     npx knex migrate:up nombreArchivo.js  

  Para revertir migraciones (**rollback**) :  

     npx knex migrate:rollback

  Para revertir una migración específica:  

     npx knex migrate:down nombreArchivo.js  

  Para listar qué migraciones están aplicadas y cuáles pendientes:

     npx knex migrate:status

### Comandos seeds en Knex: 

   Para generar un archivo en el directorio seed: 

    npx knex seed:make nombreSeed

  Para ejecutar los archivos seeds por orden alfabético:

    npx knex seed:run  

  Para ejecutar una seed específica:

    npx knex seed:run --specific=nombreArchivoSeed.js 



    

