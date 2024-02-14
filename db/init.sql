-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    genero VARCHAR(10) CHECK (genero IN ('hombre', 'mujer')),
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    foto BYTEA, -- Almacenar la imagen en forma de byte array
    correo_electronico VARCHAR(100) UNIQUE,
    contrasena VARCHAR(100) -- Se debe hacer hash a la contraseña antes de almacenarla en la base de datos
);

-- Crear la tabla de eventos
CREATE TABLE eventos (
    id SERIAL PRIMARY KEY,
    fecha_evento DATE,
    lugar VARCHAR(100),
    tipo_evento VARCHAR(100),
    nombre_platillo VARCHAR(100)
);

-- Crear la tabla de fotos de eventos
CREATE TABLE fotos_eventos (
    id SERIAL PRIMARY KEY,
    evento_id INT REFERENCES eventos(id) ON DELETE CASCADE,
    foto BYTEA
);

-- Crear la tabla de likes de fotos
CREATE TABLE likes_fotos (
    id SERIAL PRIMARY KEY,
    foto_evento_id INT REFERENCES fotos_eventos(id) ON DELETE CASCADE,
    usuario_id INT REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Crear la tabla de mensajes de chat
CREATE TABLE mensajes_chat (
    id SERIAL PRIMARY KEY,
    remitente_id INT REFERENCES usuarios(id) ON DELETE CASCADE,
    destinatario_id INT REFERENCES usuarios(id) ON DELETE CASCADE,
    mensaje TEXT,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Añadir el campo de autenticación en la tabla de usuarios
ALTER TABLE usuarios ADD COLUMN metodo_autenticacion VARCHAR(20) CHECK (metodo_autenticacion IN ('correo', 'telefono', 'google', 'facebook', 'twitter', 'apple'));
