CREATE DATABASE partylife;

\c partylife;

CREATE TABLE eventos (
    id SERIAL PRIMARY KEY,
    name_evento VARCHAR(150),
    localization VARCHAR(200) NOT NULL,
    atracao VARCHAR(100) NOT NULL,
    estilo VARCHAR(100) NOT NULL,
    horario_inicio TIME,
    horario_fim TIME
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    photo TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    evento_id INTEGER NOT NULL REFERENCES eventos(id) ON DELETE SET NULL,
    image VARCHAR(250) NOT NULL,
    content VARCHAR(300) NOT NULL,
    data_postagem DATE DEFAULT CURRENT_DATE
);