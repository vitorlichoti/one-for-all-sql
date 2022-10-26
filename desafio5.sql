SELECT C.nome_cancao as cancao, COUNT(H.cancao_id) as reproducoes
FROM SpotifyClone.tabela_historico_reproducoes as H
INNER JOIN SpotifyClone.tabela_cancoes as C
ON C.cancao_id = H.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;