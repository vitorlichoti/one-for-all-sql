SELECT
	MIN(Art.nome_artista) as artista,
	A.nome_album as album,
    COUNT(S.artista_id) as seguidores
FROM SpotifyClone.tabela_albuns as A
INNER JOIN SpotifyClone.tabela_artista as Art
ON A.artista_id = Art.artista_id
INNER JOIN SpotifyClone.tabela_seguindo_artistas as S
ON S.artista_id = A.artista_id
GROUP BY album
ORDER BY seguidores DESC, artista ASC, album ASC;