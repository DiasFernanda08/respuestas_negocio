/* PERGUNTA 1. Liste usuários com aniversário de hoje cujo número de vendas realizadas em janeiro de 2020 seja superior a 1.500 */
/*Para este desenvolvimento foi necessário trazer as informações de venda da tabela Order e as de nasimentos dos usuários da tabela clientes */
SELECT a.CUSTOMERID,b.CUANTIDAD_DE_VENTA,b.DATA_VENTA
FROM CUSTOMER a  
JOIN ORDER b ON a.CUSTOMERID=b.CUSTOMERID
WHERE a.FECHA_DE_NASCIMENTO = GETDATE ('YYYY-MM-DD')
AND b.CUANTIDAD_DE_VENTA >1500 
AND MONTH(b.DATA_VENTA)=01 
AND YEAR(b.DATA_VENTA)=2020 

/*PERGUNTA 2.Por cada mes del 2020, se solicita el top 5 de usuarios que más vendieron($) en la categoría Celulares. Se requiere el mes y año de análisis, nombre y apellido del vendedor, cantidad de ventas realizadas, cantidad de productos vendidos y el monto total transaccionado. */
/*Para este desenvolvimento o nome e apelido do vendedor foram retirados da tabela Customer, as informaçoes relacionadas a venda da tabela Order e para a relação dos itens foi utilizada a tabela Category */
SELECT TOP 5 b.NOMBRE_VENDEDOR, b.APELLIDO_VENDEDOR, 
COUNT(a.CUANTIDAD_DE_VENTA) AS 'TOTALE_VENTAS',
SUM(a.CUANTIDAD_DE_PRODUCTOS) AS 'CUANTIDAD_VENTA',
SUM (a.PRECO_DE_VENTA) AS 'MONTO_TOTAL_TRANSACCIONADO',
MONTH(a.DATA_VENTA) AS 'DATA_VENTA'
FROM ORDER a 
JOIN CUSTOMER b ON a.CUSTOMERID=b.CUSTOMERID
JOIN CATEGORY c ON b.ITEMID = c.ITEMID
WHERE .CATEGORIA = 'CELULARES Y TELEFONOS' 
AND YEAR(a.DATA_VENTA)=2020
GROUP by b.NOMBRE_VENDEDOR,b.APELLIDO_VENDEDOR, MONTH(a.DATA_VENTA)

/*PERGUNTA 3.Se solicita poblar una nueva tabla con el precio y estado de los Ítems a fin del día. Tener en cuenta que debe ser reprocesable. Vale resaltar que en la tabla Item, vamos a tener únicamente el último estado informado por la PK definida.*/
/*No primeiro código eu crio a tabela chamada Informaçoes de mercado que será atualizada com o preço e status dos itens(se inicia no update)*/
CREATE TABLE INFORMACOES_DE_MERCADO(ITEMID INTEGER PRIMARY KEY, PRECO FLOAT, ESTADO TEXT)
UPDATE [INFORMACOES_DE_MERCADO]
SET b.ESTADO= a.ESTADO
FROM ITEM a
RIGHT JOIN INFORMACOES_DE_MERCADO b  
ON a.ITEMID=b.ITEMID
