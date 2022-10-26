SELECT
	Art.nome_artista as artista,
	A.nome_album as album
FROM SpotifyClone.tabela_albuns as A
INNER JOIN SpotifyClone.tabela_artista as Art
ON A.artista_id = Art.artista_id
WHERE Art.nome_artista = 'Elis Regina'
ORDER BY album ASC;