SELECT U.nome_usuario as usuario,
IF (MAX(H.data_reproducao) > '2021-01-01', 'Usuário ativo', 'Usuário inativo') as status_usuario
FROM SpotifyClone.tabela_historico_reproducoes as H
INNER JOIN SpotifyClone.tabela_usuarios as U
ON H.usuario_id = U.usuario_id
GROUP BY usuario
ORDER BY usuario ASC;