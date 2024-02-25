DROP SCHEMA IF EXISTS BD_PRADA ;
CREATE SCHEMA IF NOT EXISTS BD_PRADA ;
USE BD_PRADA;

 
 
DROP TABLE IF EXISTS CLIENTES;
CREATE TABLE IF NOT EXISTS CLIENTES (
	ID_CLIENTE INT NOT NULL AUTO_INCREMENT,
    NOMBRE VARCHAR (25) NOT NULL,
    APELLIDO VARCHAR (30) NOT NULL,
    EMAIL VARCHAR(60) NOT NULL, 
	PRIMARY KEY (ID_CLIENTE)
);
 

DROP TABLE IF EXISTS PEDIDOS;
CREATE TABLE IF NOT EXISTS PEDIDOS (
	ID_PEDIDO int NOT NULL AUTO_INCREMENT,
    ID_CLIENTE INT NOT NULL,
    ID_PRODUCTO INT NOT NULL, 
    FECHA DATE NOT NULL,
	PRIMARY KEY (ID_PEDIDO)
);


DROP TABLE IF EXISTS PRODUCTOS;
CREATE TABLE IF NOT EXISTS PRODUCTOS (
	ID_PRODUCTO INT NOT NULL,
    NOMBRE VARCHAR (25) NOT NULL,
    PRECIO DECIMAL(10,2),
    ID_CATEGORIA INT,
	PRIMARY KEY (ID_PRODUCTO)
);


DROP TABLE IF EXISTS CATEGORIA_PROD;
CREATE TABLE IF NOT EXISTS CATEGORIA_PROD (
	ID_CATEGORIA INT NOT NULL,
    NOMBRE VARCHAR(15) NOT NULL,
	DESCRIPCION VARCHAR(150), 
	PRIMARY KEY (ID_CATEGORIA)
);

DROP TABLE IF EXISTS DISENADORES;
CREATE TABLE IF NOT EXISTS DISENADORES (
	ID_DISENADOR INT NOT NULL,
	NOMBRE VARCHAR (25) NOT NULL,
    APELLIDO VARCHAR (30) NOT NULL,
    EMAIL VARCHAR(60) NOT NULL,
	PRIMARY KEY (ID_DISENADOR)
);

DROP TABLE IF EXISTS COLECCIONES;
CREATE TABLE IF NOT EXISTS COLECCIONES (
	ID_COLECCION INT NOT NULL,
	NOMBRE VARCHAR (25) NOT NULL,
    DESCRIPCION VARCHAR(150),
    FECHA_LANZAMIENTO DATE, 
    ID_DISENADOR INT NOT NULL,
	PRIMARY KEY (ID_COLECCION)
);

DROP TABLE IF EXISTS MODELOS;
CREATE TABLE IF NOT EXISTS MODELOS (
	ID_MODELO INT NOT NULL,
	NOMBRE VARCHAR (25) NOT NULL,
    APELLIDO VARCHAR (30) NOT NULL,
    EMAIL VARCHAR(60) NOT NULL,
    PAIS_ORIGEN VARCHAR(15),
    ALTURA INT, 
    PESO INT, 
	PRIMARY KEY (ID_MODELO)
);

DROP TABLE IF EXISTS DESFILES;
CREATE TABLE IF NOT EXISTS DESFILES (
	ID_DESFILE INT NOT NULL,
	NOMBRE VARCHAR (25) NOT NULL,
    DESCRIPCION VARCHAR(150),
    FECHA DATE, 
    CIUDAD VARCHAR(15),
    PAIS VARCHAR(15),
    UBICACION VARCHAR(15),
    ID_MODELO INT NOT NULL, 
    ID_COLECCION INT NOT NULL, 
	PRIMARY KEY (ID_DESFILE)
);


ALTER TABLE PEDIDOS
ADD FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE); 

ALTER TABLE PEDIDOS
ADD FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO); 

ALTER TABLE PRODUCTOS
ADD FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA_PROD(ID_CATEGORIA); 

ALTER TABLE COLECCIONES 
ADD FOREIGN KEY (ID_DISENADOR) REFERENCES DISENADORES(ID_DISENADOR);

ALTER TABLE DESFILES
ADD FOREIGN KEY (ID_MODELO) REFERENCES MODELOS(ID_MODELO);

ALTER TABLE DESFILES
ADD FOREIGN KEY (ID_COLECCION) REFERENCES COLECCIONES(ID_COLECCION);


 /* 
 =============================================================================================== 
 =============================================================================================== 
 =============================INSERCIÓN DE DATOS ===============================================
 =============================================================================================== 
 =============================================================================================== 

 */ 

-- TABLA CLIENTES ---------------------------------------------------------------
INSERT INTO CLIENTES VALUES (1, 'Tiziana','Maddalena','tizim@gmail.com');
INSERT INTO CLIENTES VALUES (2, 'Camila','Sierra','camis@gmail.com');
INSERT INTO CLIENTES VALUES (3, 'Mora','Hezze','morah@gmail.com');
INSERT INTO CLIENTES VALUES (4, 'Juana','Vazquez','juanav@gmail.com');
INSERT INTO CLIENTES VALUES (5, 'Selena','Mosca','selem@gmail.com');
INSERT INTO CLIENTES VALUES (6, 'Mateo','Squillo','mateom@gmail.com');
INSERT INTO CLIENTES VALUES (7, 'Charly','Canda','charlyc@gmail.com');
INSERT INTO CLIENTES VALUES (8, 'Mimi','Wicz','mimiw@gmail.com');
INSERT INTO CLIENTES VALUES (9, 'Juan','Biele','juanb@gmail.com');
INSERT INTO CLIENTES VALUES (10, 'Maxi','Madda','maxim@gmail.com');
INSERT INTO CLIENTES VALUES (11, 'Mirta','Hornedo','mirtam@gmail.com');
INSERT INTO CLIENTES VALUES (12, 'Sol','Pinon','solp@gmail.com');
INSERT INTO CLIENTES VALUES (13, 'Bile','Bielewicz','bilejc@gmail.com');
INSERT INTO CLIENTES VALUES (14, 'Frida','Kalo','fridak@gmail.com');
INSERT INTO CLIENTES VALUES (15, 'Tania','Horne','taniah@gmail.com');

SELECT * FROM CLIENTES; 


-- TABLA CATEGORIA PRODUCTO ---------------------------------------------------------------
INSERT INTO CATEGORIA_PROD VALUES (1, 'Ready to wear','Pre-manufactured to standard sizes');
INSERT INTO CATEGORIA_PROD VALUES (2, 'Bags','Made of distinctive materials');
INSERT INTO CATEGORIA_PROD VALUES (3, 'Shoes','Innovative shapes, with sporty and formal inspirations,');
INSERT INTO CATEGORIA_PROD VALUES (4, 'Accesories','New ways of iconic triangle logo');
INSERT INTO CATEGORIA_PROD VALUES (5, 'Jewerly','Many materials');
INSERT INTO CATEGORIA_PROD VALUES (6, 'Prada Home','To decorate');

SELECT * FROM CATEGORIA_PROD; 

-- TABLA  PRODUCTO --------------------------------------------------------------
INSERT INTO PRODUCTOS VALUES (11001,'Re-Nylon cropped jacket','2500', 1);
INSERT INTO PRODUCTOS VALUES (11002,'Embroidered organza shirt','1800', 1);
INSERT INTO PRODUCTOS VALUES (11003,'Sequined tulle top','2500', 1);
INSERT INTO PRODUCTOS VALUES (11004,'Re-Nylon pencil skirt','1990', 1);
INSERT INTO PRODUCTOS VALUES (11005,'Denim top','1080', 1);
INSERT INTO PRODUCTOS VALUES (11006,'Cashmere cardigan','3600', 1);
INSERT INTO PRODUCTOS VALUES (11007,'Padded cotton top','1890', 1);
INSERT INTO PRODUCTOS VALUES (11008,'Cashmere polo shirt','4100', 1);
INSERT INTO PRODUCTOS VALUES (11009,'Wool pants','1560', 1);
INSERT INTO PRODUCTOS VALUES (11010,'Single-breasted wool suit','4500', 1);


INSERT INTO PRODUCTOS VALUES (11011,'Re-nylon Bag 2000','1950', 2);
INSERT INTO PRODUCTOS VALUES (11012,'Re-edition Bag 1995','1050', 2);
INSERT INTO PRODUCTOS VALUES (11013,'Re-croche Bag 2005','2100', 2);
INSERT INTO PRODUCTOS VALUES (11014,'Cleo bag','2825', 2);
INSERT INTO PRODUCTOS VALUES (11015,'Arqué leather bag','3100', 2);
INSERT INTO PRODUCTOS VALUES (11016,'Saffiano leather bag','890', 2);


INSERT INTO PRODUCTOS VALUES (11017,'Patent leather sandals','900', 3);
INSERT INTO PRODUCTOS VALUES (11018,'Leather sneakers crystals','1650', 3);
INSERT INTO PRODUCTOS VALUES (11019,'Velvet booties','1090', 3);
INSERT INTO PRODUCTOS VALUES (11020,'Velvet slippers','1650', 3);

INSERT INTO PRODUCTOS VALUES (11021,'Patent leather mini-pouch','1270', 4);
INSERT INTO PRODUCTOS VALUES (11022,'Patent leather belt','900', 4);
INSERT INTO PRODUCTOS VALUES (11023,'Velvet baseball cap','760', 4);
INSERT INTO PRODUCTOS VALUES (11024,'Metal claw clip','550', 4);
INSERT INTO PRODUCTOS VALUES (11025,'Satin bucket hat crystals','2250', 4);

INSERT INTO PRODUCTOS VALUES (11026,'Prada Symbole necklace','2250', 5);
INSERT INTO PRODUCTOS VALUES (11027,'Prada Symbole earrings','650', 5);
INSERT INTO PRODUCTOS VALUES (11028,'Prada drop earrings','675', 5);
INSERT INTO PRODUCTOS VALUES (11029,'Prada Symbole ring','675', 5);

INSERT INTO PRODUCTOS VALUES (11030,'Porcelain scented candle','380', 6);
INSERT INTO PRODUCTOS VALUES (11031,'Square catchall tray','2000', 6);
INSERT INTO PRODUCTOS VALUES (11032,'Porcelain teapot ','850', 6);
INSERT INTO PRODUCTOS VALUES (11033,'Two crystal wine glasses','240', 6);
INSERT INTO PRODUCTOS VALUES (11034,'Saffiano wood box','2100', 6);

SELECT * FROM PRODUCTOS; 


-- TABLA PEDIDOS --------------------------------------------------------------
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (1,11001,'20-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (2,11009,'31-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (3,11020,'09-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (3,11008,'10-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (1,11003,'23-11-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (5,11006,'25-11-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (6,11028,'27-11-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (15,11030,'09-09-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (13,11015,'06-08-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (14,11017,'01-08-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (11,11009,'04-07-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (8,11028,'05-06-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (7,11021,'06-06-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (6,11014,'27-09-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (2,11023,'23-12-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (4,11024,'30-09-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (2,11018,'03-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (9,11005,'20-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (9,11003,'09-10-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (11,11020,'01-11-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (10,11021,'07-12-23');

SELECT * FROM PEDIDOS; 

-- TABLA DISENADORES --------------------------------------------------------------
INSERT INTO DISENADORES VALUES (1,'Raf','Simons','rafs@gmail.com');
INSERT INTO DISENADORES VALUES (2,'Jil','Sanlder','jils@gmail.com');
INSERT INTO DISENADORES VALUES (3,'Ron','Arad','rona@gmail.com');
INSERT INTO DISENADORES VALUES (4,'James','Jen','jamesj@gmail.com');
INSERT INTO DISENADORES VALUES (5,'Rem','Koolhaas','remk@gmail.com');
INSERT INTO DISENADORES VALUES (6,'Christophe','Chemin','christophec@gmail.com');
INSERT INTO DISENADORES VALUES (7,'Ole','Scheeren','oles@gmail.com');

SELECT * FROM DISENADORES; 


-- TABLA MODELOS --------------------------------------------------------------

INSERT INTO MODELOS VALUES (1,'Adriana','Lima','adrianam@gmail.com', 'Brasil', '178','60');
INSERT INTO MODELOS VALUES (2,'Naomi','Campbell','naomic@gmail.com', 'England', '175','57');
INSERT INTO MODELOS VALUES (3,'Gigi','Haid','gigih@gmail.com', 'US', '180',null);
INSERT INTO MODELOS VALUES (4,'Linda','Evangelista','lindae@gmail.com', 'Canada', '177','55');
INSERT INTO MODELOS VALUES (5,'Karlie','Kloss','karliek@gmail.com', 'US', '188',null);
INSERT INTO MODELOS VALUES (6,'Freja Beha','Erichsen','frejabe@gmail.com', 'Denmark', '178','49');
INSERT INTO MODELOS VALUES (7,'Cara','Delevingne','carad@gmail.com', 'US', '170',null);
INSERT INTO MODELOS VALUES (8,'Anja','Rubik','anjar@gmail.com', 'Poland', '179',null);
INSERT INTO MODELOS VALUES (9,'Lara','Stone','laras@gmail.com', 'Holland', '178',null);
INSERT INTO MODELOS VALUES (10,'Amber','Valletta','amberb@gmail.com', 'US', '177',null);

SELECT * FROM MODELOS; 

-- TABLA COLECCIONES --------------------------------------------------------------

INSERT INTO COLECCIONES VALUES (1,'Fall Winter 23','Luxury and winter','01-05-23',4);
INSERT INTO COLECCIONES VALUES (2,'Holiday Collection','Reconsiders the idea of beauty through clothes','01-01-24',3);
INSERT INTO COLECCIONES VALUES (3,'Linea Rossa','Luxury for sports','01-12-22',2);
INSERT INTO COLECCIONES VALUES (4,'American cup','Relaunch of the iconic Prada American Cup sneaker','01-08-23',1);
INSERT INTO COLECCIONES VALUES (5,'Gifts','Our selection for you','01-09-23',5);
INSERT INTO COLECCIONES VALUES (6,'SS 2024 Womenswear','Spring/Summer','01-09-23',5);

SELECT * FROM COLECCIONES; 

-- TABLA DESFILES --------------------------------------------------------------
INSERT INTO DESFILES VALUES (1, 'SS 2024 Womenswear','Proposes an absolute freedom of the body expressed in lightweight dresses', '12-12-23', 'Milan','Italy','Fondazione' ,1,6);
INSERT INTO DESFILES VALUES (2, 'Fall Winter 23','The collections are unified in their fascination with and reflection of humanity', '12-01-23', 'Beijing','China','Jun’s Mansion ' ,4,1);
INSERT INTO DESFILES VALUES (3, 'Linea Rossa','The luxory for sports', '01-11-22', 'Los Angeles','US','River Bridge' ,3,3);
INSERT INTO DESFILES VALUES (4, 'Prada Holidays','', '01-10-22', 'Milan','Italy','Fondazione' ,3,2);

SELECT * FROM DESFILES; 

 /* 
 =============================================================================================== 
 =============================================================================================== 
 =============================FUNCIONES====================================================
 =============================================================================================== 
 =============================================================================================== 

 */ 

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

 /* 
 =============================================================================================== 
 =============================================================================================== 
 =============================VISTAS====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 

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

 /* 
 =============================================================================================== 
 =============================================================================================== 
 =============================STORE PROCEDURES====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 

-- Quiero saber los precios de los productos con determinado dscto
DROP PROCEDURE IF EXISTS SP_DESCUENTO;
DELIMITER $$ 
CREATE PROCEDURE SP_DESCUENTO ( in P_dscto decimal(2,1),
								in P_id_producto int, 
                                out nombre_final varchar(25),
                                out precio_ decimal(10,2),
                                out precio_final decimal(10,2))
begin 
select
        nombre,
        precio,
        precio * ( 1 - P_dscto) 
        INTO 
        nombre_final,
        precio_,
        precio_final
        from productos 
        where id_producto = P_id_producto;
end $$
delimiter $$ ;

CALL SP_DESCUENTO ( 0.1,
					11002,
					@nombre_final,
                    @precio_,
                    @precio_final);
SELECT 
		@nombre_final as nombre ,
		@precio_ as precio,
        @precio_final as precio_final



  /* 
 =============================================================================================== 
 =============================================================================================== 
 ============================= TRIGGERS ====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 
  /*
 CREATE TRIGGER TRG_NOMBRE DEL TRIGGER 
 [BEFORE/AFTER] [INSERT / DELETE/ UPDATE]
 ON NOMBRE DE LA TABLA QUE QUIERO AUDITAR 
 FOR EACH ROW 
 BEGIN 
TODO EL CODIGO /INTRUCCIONES SQL 
END 
 
 */
 
-- NEW -- INSERT UPDATE 
-- OLD -- UPDATE DELETE 
 

 -- TRIGGER 1 =============================================================================================== 

-- AUDITO LA TABLA CLIENTES C/ AFTER INSERT 

 drop table if exists LOG_AUDITORIA;
 create table if not exists LOG_AUDITORIA(
 ID_LOG INT AUTO_INCREMENT,
	ID_CLIENTE INT NOT NULL,
	NOMBRE VARCHAR (25) NOT NULL,
    APELLIDO VARCHAR (30) NOT NULL,
    EMAIL VARCHAR(60) NOT NULL, 
 NOMBRE_DE_ACCION VARCHAR(15),
 NOMBRE_TABLA VARCHAR(50),
 USUARIO VARCHAR(100),
 FECHA_UPD_INS_DEL timestamp, 
 PRIMARY KEY (ID_LOG)
 );
 
  DELIMITER // 
 CREATE TRIGGER TRG_LOG_CLIENTES 
 AFTER INSERT  
 ON BD_PRADA.CLIENTES
 FOR EACH ROW
 BEGIN 
 INSERT INTO LOG_AUDITORIA (ID_CLIENTE, NOMBRE, 
 APELLIDO, EMAIL, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
 VALUES (NEW.ID_CLIENTE, NEW.NOMBRE, NEW.APELLIDO, NEW.EMAIL, 'INSERT', 'CLIENTES', CURRENT_USER(), NOW()); 
 END//

SELECT * FROM LOG_AUDITORIA;
 

-- TRIGGER 2 ===============================================================================================
-- AUDITO LA TABLA PEDIDOS C/ BEFORE REGISTRANDO LOS CAMBIOS DE LA TABLA GUARDANDO LOS DATOS VIEJOS. 
drop table if exists LOG_AUDITORIA_2;
 create table if not exists LOG_AUDITORIA_2(
 ID_LOG INT AUTO_INCREMENT,
	ID_PEDIDO VARCHAR(50) NOT NULL,
    ID_CLIENTE VARCHAR(50) NOT NULL,
    ID_PRODUCTO VARCHAR(50) NOT NULL, 
    FECHA VARCHAR(50) NOT NULL, 
 NOMBRE_DE_ACCION VARCHAR(15),
 NOMBRE_TABLA VARCHAR(50),
 USUARIO VARCHAR(100),
 FECHA_UPD_INS_DEL timestamp, 
 PRIMARY KEY (ID_LOG)
 );

    DELIMITER // 
 CREATE TRIGGER TRG_LOG_PEDIDOS
 BEFORE UPDATE  
 ON BD_PRADA.PEDIDOS
 FOR EACH ROW
 BEGIN 
 INSERT INTO LOG_AUDITORIA_2 (ID_PEDIDO, ID_CLIENTE, 
 ID_PRODUCTO, FECHA, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
 VALUES (CONCAT('CAMPO ANTERIOR: ', old.id_pedido, ' CAMPO NUEVO: ', new.id_pedido) ,
			concat(	'CAMPO ANTERIOR: ', old.id_cliente, ' CAMPO NUEVO: ', new.id_cliente),
            concat(    'CAMPO ANTERIOR: ', old.id_producto, ' CAMPO NUEVO: ', new.id_producto),
            concat(    'CAMPO ANTERIOR: ', old.fecha, ' CAMPO NUEVO: ', new.fecha),
				'UPDATE', 
                'PEDIDOS', 
                CURRENT_USER(), 
                NOW()); 
 END//


SELECT * FROM PEDIDOS;
UPDATE PEDIDOS SET ID_CLIENTE = 3 WHERE ID_PEDIDO = 4;
UPDATE PEDIDOS SET ID_CLIENTE = 10 WHERE ID_PEDIDO = 3;
SELECT * FROM LOG_AUDITORIA_2;

 
 -- TRIGGER 3 ===============================================================================================
-- AUDITO TABLA PEDIDOS PERO DE OTRA FORMA, CON EL CAMPO CAMPONUEVO_CAMPOANTERIOR GUARDANDO EL DATO DEL ID CLIENTE
drop table if exists LOG_AUDITORIA_3;
 create table if not exists LOG_AUDITORIA_3(
 ID_LOG INT AUTO_INCREMENT,
 CAMPONUEVO_CAMPOANTERIOR VARCHAR(250), 
 NOMBRE_DE_ACCION VARCHAR(15),
 NOMBRE_TABLA VARCHAR(50),
 USUARIO VARCHAR(100),
 FECHA_UPD_INS_DEL timestamp, 
 PRIMARY KEY (ID_LOG)
 );
 
 DELIMITER // 
 CREATE TRIGGER TRG_LOG_PEDIDO_2
 BEFORE UPDATE  
 ON BD_PRADA.PEDIDOS
 FOR EACH ROW
 BEGIN 
 INSERT INTO LOG_AUDITORIA_3 (CAMPONUEVO_CAMPOANTERIOR, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
 VALUES (CONCAT('CAMPO ANTERIOR: ', old.id_CLIENTE, ' CAMPO NUEVO: ', new.id_CLIENTE) ,
				'UPDATE', 
                'PEDIDOS', 
                CURRENT_USER(), 
                NOW()); 
 END//

 SELECT * FROM PEDIDOS;
UPDATE PEDIDOS SET ID_CLIENTE = 3 WHERE ID_PEDIDO = 1;
SELECT * FROM LOG_AUDITORIA_3;

 
 
 
 
 
 /* 
 =============================================================================================== 
 =============================================================================================== 
 =============================DESAFIO TCL====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 
 
-- ELIMINO REGISTROS DE LA TABLA PRODUCTO 
ROLLBACK; -- PARA ASEGURARNOS QUE NO TOME MAS DATOS DE ARRIBA
START TRANSACTION;

SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 1 ;
SET AUTOCOMMIT = 0 ; 

SET @@FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM PRODUCTOS WHERE PRECIO > '1500';
DELETE FROM PRODUCTOS WHERE ID_PRODUCTO = 11002;
DELETE FROM PRODUCTOS WHERE ID_PRODUCTO = 11018;

-- ROLLBACK;
-- COMMIT;

-- INSERT INTO PRODUCTOS VALUES (11002,'Embroidered organza shirt','1800', 1);
-- INSERT INTO PRODUCTOS VALUES (11018,'Leather sneakers crystals','1650', 3);

-- ---------------------------------------------------------
-- INSERTO DATOS CON SAVEPOINT EN LA TABLA PEDIDOS 
ROLLBACK;
START TRANSACTION ;


INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (15,11034,'07-09-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (10,11023,'03-12-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (9,11024,'09-08-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (1,11029,'02-05-23');

SAVEPOINT sp1 ;

INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (8,11005,'01-01-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (7,11008,'04-09-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (11,11006,'07-07-23');
INSERT INTO PEDIDOS (ID_CLIENTE, ID_PRODUCTO,FECHA) VALUES (14,11022,'12-03-23');

SAVEPOINT sp2 ;

ROLLBACK to sp1 ;
-- rollback
-- COMMIT;
 
 