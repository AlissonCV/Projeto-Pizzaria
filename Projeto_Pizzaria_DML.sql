SET search_path TO pizzadelivery;

/*
Consulta 1 - Todos os dados referente ao acompanhamento da pizzaria deluxe com preço maior que 10.
*/

SELECT *
FROM acompanhamento
WHERE website LIKE '%deluxe%' AND
	  preco > MONEY(10);

/*
R:
"pizzadeluxe.com"	2	"Salada Caesar"		"Salada"	"Salada, Alface romana, croutons, queijo parmesão e molho Caesar"			"R$ 12,99"
"pizzadeluxe.com"	10	"Salada Caprese"	"Salada"	"Salada, Tomate fatiado, queijo mussarela, manjericão e azeite de oliva"	"R$ 11,99"
*/

/*
Consulta 2 - Quais os nomes das pizzas da pizzaria Pizzalandia Online possui.
*/

SELECT pz.nome
FROM pizzaria pza, pizza pz
WHERE pza.website = pz.website AND
	  LOWER(pza.website) LIKE 'pizzalandia%';
/*
R:
"Pizza Calabresa Acebolada"
"Pizza Toscana"
"Pizza Chocolate com Morangos Frescos"
"Pizza Portuguesa Especial"
"Pizza Margherita Clássica"
"Pizza Quatro Queijos Supreme"
"Pizza Brigadeiro Gourmet"
"Pizza Vegetariana Light"
"Pizza Frango com Requeijão"
"Pizza Doce de Leite com Amendoim Caramelizado"
*/
/*
Consulta 3 - Quais os nomes dos consumidores que pediram pizza na pizzaria Deluxe em ordem alfabética (listar também as pizzas).
*/

SELECT us.nome AS consumidor, pz.nome, ac.nome
FROM usuario us, consumidor_faminto cf, pedido pe, ppi, pizza pz, pizzaria pza, contem ct, acompanhamento ac
WHERE us.cod_usuario = cf.cod_cons AND
	  cf.cod_cons = pe.cod_cons AND
	  ppi.cod_pedido = pe.cod_pedido AND
	  ppi.nome = pz.nome AND
	  pz.website = pza.website AND
	  pe.cod_pedido = ct.cod_pedido AND
	  ac.cod_acompanhamento = ct.cod_acompanhamento AND
	  pza.website = ac.website AND
	  LOWER(pza.website) LIKE '%deluxe%'
ORDER BY us.nome ASC;

/*
R:
"Camila Rodrigues"	"Pizza Quatro Queijos com Catupiry"	"Café Expresso"
"Lucas Lima"		"Pizza Portuguesa Premium"			"Suco de Laranja"
"Renata Lima"		"Pizza Vegetariana Gourmet"			"Salada de Frutas"
*/

/*
Consulta 4 - Qual a pizza mais cara de cada pizzaria (listar website, nome da pizza e preço)
*/

SELECT pza.website, pz.nome AS pizza, MAX(pz.preco)
FROM pizza pz, pizzaria pza
WHERE pz.website = pza.website AND
	  pz.preco IN (SELECT MAX(pz.preco)
				   FROM pizza pz, pizzaria pza
				   WHERE pz.website = pza.website)
GROUP BY pz.nome, pza.website

/*
R:
"cheesyheaven.com"			"Pizza Brigadeiro com Morangos"			"R$ 35,90"
"pizzamaniaexpresso.com"	"Pizza Brigadeiro com Morangos"			"R$ 35,90"
"pizzadeluxe.com"			"Pizza Brigadeiro com Morangos Frescos"	"R$ 35,90"
"sliceofheaven.com"			"Pizza Brigadeiro com Morangos Frescos"	"R$ 35,90"
*/

/*
Consulta 5 - Escolha quantas tabelas achar necessário e realize insercões para exemplificar a diferença
na execução de consultas empregando LEFT OUTER JOIN. Devem ser apresentados na resolução as inserções,
as consultas e os resultados das consultas.
*/

/*
Consulta 6 - Escolha quantas tabelas achar necessário e realize insercões para exemplificar a diferença
na execução de consultas empregando RIGHT OUTER JOIN. Devem ser apresentados na resolução as inserções,
as consultas e os resultados das consultas.
*/

/*
Consulta 7 - Escolha quantas tabelas achar necessário e realize insercões para exemplificar a diferença
na execução de consultas empregando FULL OUTER JOIN. Devem ser apresentados na resolução as inserções,
as consultas e os resultados das consultas.
*/

/*
Consulta 8 - {VISÃO}
*/

/*
Consulta 9 - {VISÃO}
*/

/*
Consulta 10 - {VISÃO MATERIALIZADA}
*/