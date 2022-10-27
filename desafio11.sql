SELECT nome_cancao as nome_musica,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nome_cancao, 'Bard', 'QA'), 'Amar', 'Code Review'), 'Pais', 'Pull Requests'),'SOUL', 'CODE'), 'SUPERSTAR', 'SUPERDEV') AS novo_nome
FROM SpotifyClone.tabela_cancoes
WHERE nome_cancao LIKE '%Bard%' OR nome_cancao LIKE '%Amar%'
   OR nome_cancao LIKE '%Pais%' OR nome_cancao LIKE '%SOUL%'
   OR nome_cancao LIKE '%SUPERSTAR%'
ORDER BY nome_musica DESC;