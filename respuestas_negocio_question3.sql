--No primeiro código eu crio a tabela chamada Informaçoes de mercado que será atualizada com o preço e status dos itens(se inicia no update)--
CREATE TABLE INFORMACOES_DE_MERCADO(ITEMID INTEGER PRIMARY KEY, PRECO FLOAT, ESTADO TEXT)
UPDATE [INFORMACOES_DE_MERCADO]
SET b.ESTADO= a.ESTADO
FROM ITEM a
RIGHT JOIN INFORMACOES_DE_MERCADO b  
ON a.ITEMID=b.ITEMID
