/* 
 =============================================================================================== 
 =============================================================================================== 
 ============================= FUNCIONES ====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 

DROP SCHEMA IF EXISTS BD_PRADA ;
CREATE SCHEMA IF NOT EXISTS BD_PRADA ;
USE BD_PRADA;


 /* 
FUNCION NRO 1: quiero saber el precio del producto con tax 
 */ 
 
 -- consulta: 
   select  distinct 
         precio * 1.06  as con_tax
       from productos 
       where id_producto = 11022;
 -- resultaddo: $954
 
-- Paso a funcion:

DROP FUNCTION IF EXISTS FN_con_tax ;
 DELIMITER $$ 
 CREATE FUNCTION FN_con_tax(P_tax decimal (4,2), 
							P_id_producto int )
RETURNS int 
DETERMINISTIC                             
BEGIN 
declare v_con_tax decimal (10,2);

set v_con_tax = 
	 (select  distinct 
         precio * P_tax as con_tax
       from productos 
       where id_producto = P_id_producto)
       ;

  RETURN v_con_tax ;
END$$
DELIMITER ;     

SELECT FN_con_tax(1.06,11022);

 /* 
FUNCION NRO 2: quiero ver las ventas que superaron determinado monto por cliente
 */ 
 
  -- consulta: 
 select distinct sum(precio) as 'Venta total'
 from productos join pedidos 
 on productos.id_producto = pedidos.id_producto
 where precio > '800'
 and id_cliente = '3'
;
-- resultado: 5750

-- paso a funcion:
DROP FUNCTION IF EXISTS FN_VENTA_X_CLIENTE ;
 DELIMITER $$ 
 CREATE FUNCTION FN_VENTA_X_CLIENTE ( P_precio decimal(10,2),
							P_id_cliente int 
 )
RETURNS FLOAT 
DETERMINISTIC                             
BEGIN 
DECLARE V_resultado DECIMAL (10,2);

SET V_resultado = (
 select distinct sum(precio) 
 from productos join pedidos 
 on productos.id_producto = pedidos.id_producto
 where precio > P_precio
 and id_cliente = P_id_cliente
);

RETURN  V_resultado  ;
END$$
DELIMITER ;     

SELECT FN_VENTA_X_CLIENTE (800,3) as 'Venta total' ;
