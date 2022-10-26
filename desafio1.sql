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
      `usuario_ativo` BIT,
      `plano_id` int,
      CONSTRAINT PK_Usuario PRIMARY KEY (`usuario_id`),
      CONSTRAINT FK_Plano FOREIGN KEY (`plano_id`)
      REFERENCES SpotifyClone.`tabela_planos`(`plano_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_albuns`(
      `album_id` int NOT NULL AUTO_INCREMENT,
      `nome_album` varchar(200) NOT NULL,
      `ano_lancamento` YEAR,
      `artista_id` int,
      CONSTRAINT PK_Album PRIMARY KEY (`album_id`),
      CONSTRAINT FK_Artista FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.`tabela_artista`(`artista_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_cancoes`(
      `cancao_id` int NOT NULL AUTO_INCREMENT,
      `nome_cancao` varchar(200) NOT NULL,
      `duracao` int NOT NULL,
      `album_id` int,
      CONSTRAINT PK_Cancao PRIMARY KEY (`cancao_id`),
      CONSTRAINT FK_Album FOREIGN KEY (`album_id`) REFERENCES SpotifyClone.`tabela_albuns`(`album_id`)
  );
  
  CREATE TABLE SpotifyClone.`tabela_historico_reproducoes`(
      `cancao_id` int NOT NULL,
      `usuario_id` int NOT NULL,
      `data_reproducao` DATETIME,
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

  INSERT INTO SpotifyClone.`tabela_planos` (`tipo_plano`, `valor`)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.`tabela_albuns` (`nome_album`)
  VALUES
    ('Renaissance'),
    ('Jazz'),
    ('Hot Space'),
    ('Falso Brilhante'),
    ('Vento de Maio'),
    ('QVVJFA?'),
    ('Somewhere Far Beyond'),
    ('I Put A Spell On You');

  INSERT INTO SpotifyClone.`tabela_artista` (`nome_artista`)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.`tabela_usuarios` (`nome_usuario`, `idade`)
  VALUES
    ('Barbara Liskov', '82'),
    ('Robert Cecil Martin', '58'),
    ('Ada Lovelace', '37'),
    ('Martin Fowler', '46'),
    ('Sandi Metz', '58'),
    ('Paulo Freire', '19'),
    ('Bell Hooks', '26'),
    ('Christopher Alexander', '85'),
    ('Judith Butler', '45'),
    ('Jorge Amado', '58');

  INSERT INTO SpotifyClone.`tabela_cancoes` (`nome_cancao`, `duracao`)
  VALUES
    ('BREAK MY SOUL', 279),
    ('VIRGOS GROOVE', 369),
    ('ALIEN SUPERSTAR', 116),
    ('Dont Stop Me Now', 203),
    ('Under Pressure', 152),
    ('Como Nossos Pais', 105),
    ('O Medo de Amar é o Medo de Ser Livre', 207),
    ('Samba em Paris', 267),
    ('The Bards Song', 244),
    ('Feeling Good', 100);

  INSERT INTO SpotifyClone.`tabela_historico_reproducoes` (`cancao_id`, `usuario_id`)
  VALUES
    (8, 1),
    (2, 1),
    (10, 1),
    (10, 2),
    (7, 2),
    (10, 3),
    (1, 3),
    (8, 4),
    (8, 5),
    (4, 5),
    (7, 6),
    (2, 6),
    (5, 7),
    (5, 8),
    (9, 9),
    (3, 10);

  INSERT INTO SpotifyClone.`tabela_seguindo_artistas` (`artista_id`, `usuario_id`)
  VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (1, 3),
    (3, 3),
    (2, 4),
    (4, 5),
    (5, 5),
    (6, 7),
    (6, 9),
    (3, 9),
    (1, 10);
    

