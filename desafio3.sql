SELECT
	tuser.nome_usuario as usuario,
	COUNT(thistory.usuario_id) as qt_de_musicas_ouvidas,
  ROUND(SUM(tcan.duracao) / 60, 2) as total_minutos
FROM SpotifyClone.tabela_usuarios as tuser
INNER JOIN SpotifyClone.tabela_historico_reproducoes as thistory
ON tuser.usuario_id = thistory.usuario_id
INNER JOIN SpotifyClone.tabela_cancoes as tcan
ON thistory.cancao_id = tcan.cancao_id
GROUP BY nome_usuario
ORDER BY nome_usuario;