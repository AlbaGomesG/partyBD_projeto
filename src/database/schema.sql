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
    senha VARCHAR(100) NOT NULL,
    photo TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    evento_id INTEGER NOT NULL REFERENCES eventos(id) ON DELETE SET NULL,
    image TEXT NOT NULL,
    content VARCHAR(300) NOT NULL,
    data_postagem DATE DEFAULT CURRENT_DATE
);

CREATE TABLE cards(
    id SERIAL PRIMARY KEY,
    photo TEXT,
    name VARCHAR(90) NOT NULL,
    idade INTEGER,
    description TEXT,
    id_categories INTEGER REFERENCES categories(id) ON DELETE CASCADE,
    id_genres INTEGER REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    style VARCHAR(100) 
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);



INSERT INTO eventos (name_evento, localization, atracao, estilo, horario_inicio, horario_fim)
VALUES
('Noite do Rock', 'Arena Musical', 'Banda Thunder', 'Rock', '21:00:00', '23:00:00');
INSERT INTO eventos (name_evento, localization, atracao, estilo, horario_inicio, horario_fim)
VALUES
('Festa Sunset', 'Praia do Sol', 'DJ Alex', 'Eletrônica', '16:00', '22:00'),
('Rock Night', 'Bar do Rock', 'Banda Thunder', 'Rock', '20:00', '02:00'),
('Jazz ao Vivo', 'Clube do Jazz', 'Trio Jazz', 'Jazz', '19:00', '23:00'),
('Samba na Praça', 'Praça Central', 'Grupo Samba Show', 'Samba', '18:00', '22:00'),
('Festival de Blues', 'Teatro Municipal', 'Blues Band', 'Blues', '17:00', '21:00'),
('Pop Party', 'Clube da Cidade', 'DJ PopStar', 'Pop', '21:00', '03:00'),
('Reggae Vibes', 'Praia Verde', 'Banda Reggae Roots', 'Reggae', '15:00', '20:00'),
('Hip Hop Night', 'Arena Urbana', 'MC Flow', 'Hip Hop', '22:00', '04:00'),
('Clássicos do Sertanejo', 'Rancho Alegre', 'Dupla Sertaneja', 'Sertanejo', '20:00', '01:00'),
('Noite Latina', 'Casa Latina', 'Banda Salsa', 'Latina', '19:00', '23:30'),
('Eletronic Beats', 'Clube Eletrônico', 'DJ BeatMaster', 'Eletrônica', '23:00', '05:00'),
('Festival de Forró', 'Centro Cultural', 'Trio Forró', 'Forró', '18:00', '23:00'),
('Noite de Tango', 'Salão de Dança', 'Orquestra Tango', 'Tango', '20:00', '00:00'),
('Festa Anos 80', 'Discoteca Flashback', 'DJ Retro', 'Anos 80', '21:00', '02:00'),
('Festival de Música Clássica', 'Auditório Maestro', 'Orquestra Sinfônica', 'Clássica', '17:00', '20:00'),
('Noite de K-Pop', 'Arena K', 'Grupo K-Pop', 'K-Pop', '19:00', '23:00'),
('Festival de Rap', 'Palco Urbano', 'MCs Unidos', 'Rap', '20:00', '01:00'),
('Noite de MPB', 'Bar da MPB', 'Cantor MPB', 'MPB', '18:00', '22:00'),
('Festival de Música Indie', 'Parque Indie', 'Banda Indie', 'Indie', '16:00', '21:00'),
('Festa de Carnaval', 'Sambódromo', 'Escola de Samba', 'Carnaval', '20:00', '03:00');


INSERT INTO users (name, email, photo)
VALUES
('João Silva', 'joao.silva@example.com', 'photo1.jpg'),
('Maria Oliveira', 'maria.oliveira@example.com', 'photo2.jpg'),
('Carlos Souza', 'carlos.souza@example.com', 'photo3.jpg'),
('Ana Lima', 'ana.lima@example.com', 'photo4.jpg'),
('Pedro Santos', 'pedro.santos@example.com', 'photo5.jpg'),
('Fernanda Costa', 'fernanda.costa@example.com', 'photo6.jpg'),
('Lucas Almeida', 'lucas.almeida@example.com', 'photo7.jpg'),
('Juliana Pereira', 'juliana.pereira@example.com', 'photo8.jpg'),
('Rafael Mendes', 'rafael.mendes@example.com', 'photo9.jpg'),
('Camila Rocha', 'camila.rocha@example.com', 'photo10.jpg'),
('Bruno Martins', 'bruno.martins@example.com', 'photo11.jpg'),
('Larissa Silva', 'larissa.silva@example.com', 'photo12.jpg'),
('Gabriel Ferreira', 'gabriel.ferreira@example.com', 'photo13.jpg'),
('Isabela Ribeiro', 'isabela.ribeiro@example.com', 'photo14.jpg'),
('Thiago Barbosa', 'thiago.barbosa@example.com', 'photo15.jpg'),
('Carolina Nunes', 'carolina.nunes@example.com', 'photo16.jpg'),
('Felipe Araujo', 'felipe.araujo@example.com', 'photo17.jpg'),
('Vanessa Moraes', 'vanessa.moraes@example.com', 'photo18.jpg'),
('Rodrigo Teixeira', 'rodrigo.teixeira@example.com', 'photo19.jpg'),
('Patrícia Gomes', 'patricia.gomes@example.com', 'photo20.jpg');


INSERT INTO posts (user_id, evento_id, image, content)
VALUES
(1, 1, 'image1.jpg', 'Evento incrível!'),
(2, 2, 'image2.jpg', 'Adorei a vibe!'),
(3, 3, 'image3.jpg', 'Música excelente!'),
(4, 4, 'image4.jpg', 'Que noite maravilhosa!'),
(5, 5, 'image5.jpg', 'Blues sensacional!'),
(6, 6, 'image6.jpg', 'Pop perfeito!'),
(7, 7, 'image7.jpg', 'Reggae relaxante!'),
(8, 8, 'image8.jpg', 'Hip Hop de qualidade!'),
(9, 9, 'image9.jpg', 'Sertanejo raiz!'),
(10, 10, 'image10.jpg', 'Noite latina animada!'),
(11, 11, 'image11.jpg', 'Eletrônica top!'),
(12, 12, 'image12.jpg', 'Forró contagiante!'),
(13, 13, 'image13.jpg', 'Tango emocionante!'),
(14, 14, 'image14.jpg', 'Anos 80 nostálgicos!'),
(15, 15, 'image15.jpg', 'Clássica impecável!'),
(16, 16, 'image16.jpg', 'K-Pop incrível!'),
(17, 17, 'image17.jpg', 'Rap autêntico!'),
(18, 18, 'image18.jpg', 'MPB maravilhosa!'),
(19, 19, 'image19.jpg', 'Indie inspirador!'),
(20, 20, 'image20.jpg', 'Carnaval inesquecível!');


/* inserts de card de front */


INSERT INTO categories (style)
VALUES
('Lugares'),
('Atrações'),
('Estilos');


INSERT INTO genres (name)
VALUES
('Samba'),
('Blues'),
('Rock'),
('Pop'),
('Reggae'),
('Hip Hop'),
('Sertanejo'),
('Latina'),
('Eletrônica'),
('Jazz'),
('Funk'),
('Clássica'),
('K-Pop'),
('Rap'),
('MPB'),
('Indie'),
('Carnaval');

-- Inserindo usuários na tabela 'users'
INSERT INTO users (name, email, senha, photo)
VALUES
    ('João Silva', 'joao.silva@email.com', 'senha123', 'https://example.com/photo1.jpg'),
    ('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', 'https://example.com/photo2.jpg'),
    ('Carlos Souza', 'carlos.souza@email.com', 'senha789', 'https://example.com/photo3.jpg');

INSERT INTO cards (photo, name, idade, description, id_categories, id_genres)
VALUES
('photo1.jpg', 'Card Samba', 25, 'Descrição do card de música samba', 3, 1),
('photo2.jpg', 'Card Blues', 30, 'Descrição do card de música blues', 3, 2),
('photo3.jpg', 'Card Rock', 20, 'Descrição do card de música rock', 3, 3),
('photo4.jpg', 'Card Pop', 22, 'Descrição do card de música pop', 3, 4),
('photo5.jpg', 'Card Reggae', 28, 'Descrição do card de música reggae', 3, 5),
('photo6.jpg', 'Card Hip Hop', 24, 'Descrição do card de música hip hop', 3, 6),
('photo7.jpg', 'Card Sertanejo', 27, 'Descrição do card de música sertaneja', 3, 7),
('photo8.jpg', 'Card Latina', 26, 'Descrição do card de música latina', 3, 8),
('photo9.jpg', 'Card Eletrônica', 23, 'Descrição do card de música eletrônica', 3, 9),
('photo10.jpg', 'Card Jazz', 29, 'Descrição do card de música jazz', 3, 10),
('photo11.jpg', 'Card Funk', 21, 'Descrição do card de música funk', 3, 11),
('photo12.jpg', 'Card Clássica', 35, 'Descrição do card de música clássica', 3, 12),
('photo13.jpg', 'Card K-Pop', 19, 'Descrição do card de música K-Pop', 3, 13),
('photo14.jpg', 'Card Rap', 24, 'Descrição do card de música rap', 3, 14),
('photo15.jpg', 'Card MPB', 32, 'Descrição do card de música MPB', 3, 15),
('photo16.jpg', 'Card Indie', 28, 'Descrição do card de música indie', 3, 16),
('photo17.jpg', 'Card Carnaval', 30, 'Descrição do card de música de carnaval', 3, 17);