/* 
 =============================================================================================== 
 =============================================================================================== 
 ========================  CREACIÓN DE TABLAS E INCERSIÓN DE DATOS ============================
 =============================================================================================== 
 =============================================================================================== 
 */ 
 

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
