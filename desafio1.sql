DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.`tabela_planos`(
      `plano_id` int NOT NULL AUTO_INCREMENT,
      `tipo_plano` varchar(200) NOT NULL,
      `valor` FLOAT(3, 2) NOT NULL,
      CONSTRAINT PK_Plano PRIMARY KEY (`plano_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_artista`(
      `artista_id` int NOT NULL AUTO_INCREMENT,
      `nome_artista` varchar(100) NOT NULL,
      CONSTRAINT PK_Artista PRIMARY KEY (`artista_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_usuarios`(
      `usuario_id` int NOT NULL AUTO_INCREMENT,
      `nome_usuario` varchar(200) NOT NULL,
      `idade` int NOT NULL,
      `data_assinatura` DATETIME,
      `plano_id` int NOT NULL,
      CONSTRAINT PK_Usuario PRIMARY KEY (`usuario_id`),
      CONSTRAINT FK_Plano FOREIGN KEY (`plano_id`)
      REFERENCES SpotifyClone.`tabela_planos`(`plano_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_albuns`(
      `album_id` int NOT NULL AUTO_INCREMENT,
      `nome_album` varchar(200) NOT NULL,
      `ano_lancamento` YEAR,
      `artista_id` int NOT NULL,
      CONSTRAINT PK_Album PRIMARY KEY (`album_id`),
      CONSTRAINT FK_Artista FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.`tabela_artista`(`artista_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_cancoes`(
      `cancao_id` int NOT NULL AUTO_INCREMENT,
      `nome_cancao` varchar(200) NOT NULL,
      `duracao` int NOT NULL,
      `album_id` int NOT NULL,
      CONSTRAINT PK_Cancao PRIMARY KEY (`cancao_id`),
      CONSTRAINT FK_Album FOREIGN KEY (`album_id`) REFERENCES SpotifyClone.`tabela_albuns`(`album_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_historico_reproducoes`(
      `cancao_id` int NOT NULL,
      `data_reproducao` DATETIME NOT NULL,
      `usuario_id` int NOT NULL,
      CONSTRAINT PK_Historico PRIMARY KEY (`cancao_id`, `usuario_id`),
      CONSTRAINT FK_Cancao FOREIGN KEY (`cancao_id`)
      REFERENCES SpotifyClone.`tabela_cancoes`(`cancao_id`),
      CONSTRAINT FK_Usuario FOREIGN KEY (`usuario_id`)
      REFERENCES SpotifyClone.`tabela_usuarios`(`usuario_id`)
  );

  CREATE TABLE SpotifyClone.`tabela_seguindo_artistas`(
      `artista_id` int,
      `usuario_id` int,
      CONSTRAINT PK_Seguindo PRIMARY KEY (`artista_id`, `usuario_id`),
      FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.`tabela_artista`(`artista_id`),
      FOREIGN KEY (`usuario_id`) REFERENCES SpotifyClone.`tabela_usuarios`(`usuario_id`)
  );

INSERT INTO SpotifyClone.`tabela_planos`(tipo_plano, valor)
VALUES ('gratuito', 0),
       ('familiar', 7.99),
       ('universitário', 5.99),
       ('pessoal', 6.99);

INSERT INTO SpotifyClone.`tabela_usuarios`(nome_usuario, idade, plano_id, data_assinatura)
VALUES ('Barbara Liskov', 82, 1, DATE('2019-10-20')),
       ('Robert Cecil Martin', 58, 1, DATE('2017-01-06')),
       ('Ada Lovelace', 37, 2, DATE('2017-12-30')),
       ('Martin Fowler', 46, 2, DATE('2017-01-17')),
       ('Sandi Metz', 58, 2, DATE('2018-04-29')),
       ('Paulo Freire', 19, 3, DATE('2018-02-14')),
       ('Bell Hooks', 26, 3, DATE('2018-01-05')),
       ('Christopher Alexander', 85, 4, DATE('2019-06-05')),
       ('Judith Butler', 45, 4, DATE('2020-05-13')),
       ('Jorge Amado', 58, 4, DATE('2017-02-17'));

INSERT INTO SpotifyClone.`tabela_artista`(nome_artista)
VALUES ('Beyoncé'),
       ('Queen'),
       ('Elis Regina'),
       ('Baco Exu do Blues'),
       ('Blind Guardian'),
       ('Nina Simone');

INSERT INTO SpotifyClone.`tabela_albuns`(nome_album, ano_lancamento, artista_id)
VALUES ('Renaissance', 2022, 1),
       ('Jazz', 1978, 2),
       ('Hot Space', 1982, 2),
       ('Falso Brilhante', 1998, 3),
       ('Vento de Maio', 2001, 3),
       ('QVVJFA?', 2003, 4),
       ('Somewhere Far Beyond', 2007, 5),
       ('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.`tabela_cancoes`(nome_cancao, duracao, album_id)
VALUES ('BREAK MY SOUL', 279, 1),
       ('VIRGO’S GROOVE', 369, 1),
       ('ALIEN SUPERSTAR', 116, 1),
       ('Don’t Stop Me Now', 203, 2),
       ('Under Pressure', 152, 3),
       ('Como Nossos Pais', 105, 4),
       ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
       ('Samba em Paris', 267, 6),
       ('The Bard’s Song', 244, 7),
       ('Feeling Good', 100, 8);

INSERT INTO SpotifyClone.`tabela_historico_reproducoes` (usuario_id, cancao_id, data_reproducao)
VALUES (1, 8, DATE('2022-02-28 10:45:55')),
       (1, 2, DATE('2020-05-02 05:30:35')),
       (1, 10, DATE('2020-03-06 11:22:33')),
       (2, 10, DATE('2022-08-05 08:05:17')),
       (2, 7, DATE('2020-01-02 07:40:33')),
       (3, 10, DATE('2020-11-13 16:55:13')),
       (3, 2, DATE('2020-12-05 18:38:30')),
       (4, 8, DATE('2021-08-15 17:10:10')),
       (5, 8, DATE('2022-01-09 01:44:33')),
       (5, 5, DATE('2020-08-06 15:23:43')),
       (6, 7, DATE('2017-01-24 00:31:17')),
       (6, 1, DATE('2017-10-12 12:35:20')),
       (7, 4, DATE('2011-12-15 22:30:49')),
       (8, 4, DATE('2012-03-17 14:56:41')),
       (9, 9, DATE('2022-02-24 21:14:22')),
       (10, 3, DATE('2015-12-13 08:30:22'));

INSERT INTO SpotifyClone.`tabela_seguindo_artistas` (usuario_id, artista_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 3),
       (3, 2),
       (4, 4),
       (5, 5),
       (5, 6),
       (6, 6),
       (6, 1),
       (7, 6),
       (9, 3),
       (10, 2);