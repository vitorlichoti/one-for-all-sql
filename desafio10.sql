SELECT C.nome_cancao as nome, COUNT(H.cancao_id) as reproducoes
FROM SpotifyClone.tabela_historico_reproducoes as H
INNER JOIN SpotifyClone.tabela_cancoes as C
ON H.cancao_id = C.cancao_id
INNER JOIN SpotifyClone.tabela_usuarios as U
ON H.usuario_id = U.usuario_id
WHERE U.plano_id = 1 OR U.plano_id = 4
GROUP BY nome
ORDER BY nome ASC;