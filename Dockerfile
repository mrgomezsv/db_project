FROM postgres:latest

# Copiar el script SQL al directorio docker-entrypoint-initdb.d
COPY ./db/init.sql /docker-entrypoint-initdb.d/
