CREATE DATABASE partylife;

\c partylife;



CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    photo TEXT
);

-- Inserindo usuários na tabela 'users'
INSERT INTO users (name, email, senha, photo)
VALUES
    ('João Silva', 'joao.silva@email.com', 'senha123', 'https://example.com/photo1.jpg'),
    ('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', 'https://example.com/photo2.jpg'),
    ('Carlos Souza', 'carlos.souza@email.com', 'senha789', 'https://example.com/photo3.jpg');
