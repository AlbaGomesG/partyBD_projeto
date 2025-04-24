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

