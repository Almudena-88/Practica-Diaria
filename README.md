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
       OSTGRES_DB: practica
       ports:
       - "5432:5432"
       volumes:
      - db_data:/var/lib/postgresql/data

     volumes:
      db_data:

### Comandos de uso diario:

#### Levantar contenedores:
    docker compose up

   #### Levantar contenedores en segundo plano
    docker compose up -d

   #### Detener y eliminar los contenedores    
    docker compose down

   #### Construir imágenes
    docker compose build 

   ### Resetear la contraseña (Portainer) 
    docker container stop portainer
    docker run --rm -v portainer_data:/data portainer/helper-reset-password
    docker container start portainer

 ## ·Git
 
   ### Definir nombre de usuario y correo 
     git config --global user.name "Nombre" y git config --global user.email "correo.com"
 
   ### Inicializar el repositorio desde la carpeta del proyecto en el Editor
     git innit

   ### Trabajar sobre la rama principal, añadiendo archivos y almacenar los cambios temporalmente (stage) y guardarlos
     git add nombre_archivo
     git commit -m "Comentario del commit"

   ### Crear nuevas ramas 
     git branch nombre-rama

   ### Unificar el trabajo se varias ramas en la principal
     git merge nombre-rama

   ### Crear nuevas ramas sobre las que trabajar paralelamente de forma temporal antes de fusionarla a la principal
     feature branch: git switch -c segunda-rama 
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

 

