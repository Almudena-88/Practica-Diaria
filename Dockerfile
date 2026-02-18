# Crear un contenedor en base a la imagen indicada
FROM node:18

# Run ejecuta comandos (instalar, crear carpetas, etc)
RUN mkdir -p /home/app

# Copiar desde la raíz de nuestra ruta actual hacia la estructura de carpetas previamente creadas
COPY . /home/app

# El comando node indica que se tiene que ejecutar el archivo index.js
CMD ["node", "/home/app/index.js"]











