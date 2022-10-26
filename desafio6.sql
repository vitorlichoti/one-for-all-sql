SELECT
	FORMAT(MIN(P.valor), 2) as faturamento_minimo,
	FORMAT(MAX(P.valor), 2) as faturamento_maximo,
  FORMAT(AVG(P.valor), 2) as faturamento_medio,
  FORMAT(SUM(P.valor), 2) as faturamento_total
FROM SpotifyClone.tabela_usuarios as U
INNER JOIN SpotifyClone.tabela_planos as P
ON U.plano_id = P.plano_id;