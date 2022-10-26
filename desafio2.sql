SELECT
  (SELECT COUNT(`nome_cancao`) FROM SpotifyClone.tabela_cancoes) AS cancoes,
  (SELECT COUNT(`nome_artista`) FROM SpotifyClone.tabela_artista) AS artistas,
  (SELECT COUNT(`nome_album`) FROM SpotifyClone.tabela_albuns) AS albuns;