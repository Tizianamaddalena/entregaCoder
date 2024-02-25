/* 
 =============================================================================================== 
 =============================================================================================== 
 ============================= VISTAS ====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 
 
DROP SCHEMA IF EXISTS BD_PRADA ;
CREATE SCHEMA IF NOT EXISTS BD_PRADA ;
USE BD_PRADA;



-- Nombre, Apellido y Pais de Origen de las modelos que hayan participado en los desfiles de Italia 
CREATE OR REPLACE VIEW DESFILE_ITALIA_MODELOS AS (
	SELECT M.NOMBRE, APELLIDO, PAIS_ORIGEN
	FROM MODELOS AS M JOIN DESFILES AS D
	ON M.ID_MODELO = D.ID_MODELO 
	WHERE D.PAIS = "ITALY"
	ORDER BY M.NOMBRE DESC 
);


-- Mostrar el Nombre, Apellido y Mail de los clientes que gastaron mas de $1500 y el monto total

CREATE OR REPLACE VIEW CLIENTES_MAYORES_1500 AS (
	SELECT DISTINCT C.NOMBRE, C.APELLIDO, C.EMAIL, SUM(PROD.PRECIO) AS 'MONTO TOTAL'
	FROM CLIENTES AS C JOIN PEDIDOS AS PE
	ON C.ID_CLIENTE = PE.ID_CLIENTE 
	JOIN PRODUCTOS AS PROD
	ON PE.ID_PRODUCTO = PROD.ID_PRODUCTO
	WHERE PROD.PRECIO > '1500'
	GROUP BY C.NOMBRE, C.APELLIDO, C.EMAIL, PROD.PRECIO
	ORDER BY C.NOMBRE ASC
);

