/* 
 =============================================================================================== 
 =============================================================================================== 
 ============================= TRIGGERS ====================================================
 =============================================================================================== 
 =============================================================================================== 
 */ 
 
 DROP SCHEMA IF EXISTS BD_PRADA ;
CREATE SCHEMA IF NOT EXISTS BD_PRADA ;
USE BD_PRADA;
 
 
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

 
 
 