DROP SCHEMA IF EXISTS biblioteca;
CREATE SCHEMA biblioteca;

CREATE TABLE IF NOT EXISTS biblioteca.carrera (
  idCarrera INT NOT NULL COMMENT 'El identificador de la carrera',
  nombre VARCHAR(250) NOT NULL COMMENT 'El nombre de la carrera',
  estado CHAR(2) NOT NULL DEFAULT 'AC'
	CONSTRAINT chk_carrera_estado
	CHECK( estado in('AC', 'EX') ) ENFORCED COMMENT 'El estado de operación: (AC) activo y (EX) experido',
  PRIMARY KEY (idCarrera)
);

CREATE TABLE IF NOT EXISTS biblioteca.servicio (
  idServicio INT NOT NULL COMMENT 'El identificador del servicio',
  nombre VARCHAR(100) NOT NULL COMMENT 'El nombre del servicio',
  estado CHAR(2) NOT NULL DEFAULT 'AC'
	CHECK( estado in('AC', 'EX') ) ENFORCED COMMENT 'El estado de operación: (AC) activo y (EX) expirado',
  PRIMARY KEY (idServicio)
);

CREATE TABLE IF NOT EXISTS biblioteca.alumno (
  matricula VARCHAR(12) NOT NULL COMMENT 'El identificador unico',
  estado CHAR(2) NOT NULL DEFAULT 'AC' 
  CHECK( estado in('AC', 'EX') ) ENFORCED COMMENT 'El estado de operación: (AC) activo y (EX) experido',
  apePaterno VARCHAR(50) NOT NULL COMMENT 'El apellido paterno',
  apeMaterno VARCHAR(50) NULL COMMENT 'El apellido materno',
  nombre1 VARCHAR(50) NOT NULL COMMENT 'El primer nombre',
  nombre2 VARCHAR(50) NULL COMMENT 'El segundo nombre',
  nombre3 VARCHAR(50) NULL COMMENT 'El tercer nombre',
  nombre4 VARCHAR(50) NULL COMMENT 'El cuarto nombre',
  idCarrera INT NOT NULL COMMENT 'El identificador de la carrera',
  PRIMARY KEY (matricula),
  CONSTRAINT fk_alumno_carrera FOREIGN KEY (idCarrera)
    REFERENCES biblioteca.carrera (idCarrera)
);

CREATE TABLE IF NOT EXISTS biblioteca.visita (
  idVisita INT NOT NULL COMMENT 'El identificador unico',
  fecha DATE NOT NULL COMMENT 'La fecha de la visita',
  horaEntrada TIME NOT NULL COMMENT 'La hora de entrada',
  horaSalida TIME NULL COMMENT 'La hora de salida',
  estado CHAR(3) NOT NULL DEFAULT 'ACT'
	CHECK( estado in('ACT', 'BLO') ) ENFORCED COMMENT 'El estado de operación: (ACT) activo y (BLO) bloqueada',
  matricula VARCHAR(12) NOT NULL COMMENT 'La matricula del alumno',
  PRIMARY KEY (idVisita),
  CONSTRAINT fk_visita_alumno FOREIGN KEY (matricula)
    REFERENCES biblioteca.alumno (matricula)
);

CREATE TABLE IF NOT EXISTS biblioteca.usuario (
  idUsuario VARCHAR(12) NOT NULL COMMENT 'El nombre del usuario',
  apePaterno VARCHAR(50) NOT NULL COMMENT 'El apellido paterno',
  nombre VARCHAR(50) NOT NULL COMMENT 'El nombre',
  estado CHAR(3) NOT NULL
	CHECK( estado in('ACT', 'IAC', 'BLO') ) ENFORCED COMMENT 'El estado de operación: (ACT) activo, (IAC) inactivo, (BLO) bloqueado',
  contra VARCHAR(20) NOT NULL COMMENT 'La contraseña del usuario',
  tipo CHAR(3) NOT NULL DEFAULT 'ENC'
	CHECK( tipo in('ADM', 'ENC') ) ENFORCED COMMENT 'El rol del usuario',
  PRIMARY KEY (idUsuario)
);

CREATE TABLE IF NOT EXISTS biblioteca.reporte (
  idReporte INT NOT NULL COMMENT 'El identificador',
  fecha DATE NOT NULL COMMENT 'La fecha en la que se realizo',
  fechaInicio DATE NOT NULL COMMENT 'La fecha de inicio para reportar',
  fechaFin DATE NOT NULL COMMENT 'La fecha de fin del reporte',
  idUsuario VARCHAR(12) NOT NULL COMMENT 'El identificador del que lo realizo',
  PRIMARY KEY (idReporte),
  CONSTRAINT fk_reporte_usuario FOREIGN KEY (idUsuario)
    REFERENCES biblioteca.usuario (idUsuario),
  CONSTRAINT chk_reporte_fechas
	CHECK ( fechaInicio < fechaFin ) ENFORCED
);

CREATE TABLE IF NOT EXISTS biblioteca.tienen (
  idVisita INT NOT NULL,
  idServicio INT NOT NULL,
  PRIMARY KEY (idVisita, idServicio),
  CONSTRAINT fk_tienen_visita FOREIGN KEY (idVisita)
    REFERENCES biblioteca.visita (idVisita),
  CONSTRAINT fk_tienen_servicio FOREIGN KEY (idServicio)
    REFERENCES biblioteca.servicio (idServicio)
);

CREATE TABLE IF NOT EXISTS biblioteca.dataCarrera (
  idReporte INT NOT NULL,
  PRIMARY KEY (idReporte),
  CONSTRAINT fk_dataCarrera_reporte FOREIGN KEY (idReporte)
    REFERENCES biblioteca.reporte (idReporte)
);

CREATE TABLE IF NOT EXISTS biblioteca.dataServicio (
  idReporte INT NOT NULL,
  PRIMARY KEY (idReporte),
  CONSTRAINT fk_dataServicio_reporte FOREIGN KEY (idReporte)
    REFERENCES biblioteca.reporte (idReporte)
);
use biblioteca;
drop procedure if exists proce_nuevo_servicio;
drop procedure if exists proce_nueva_carrera;
drop procedure if exists proce_reporte;
	drop procedure if exists proce_actualizar_visitas;
	drop procedure if exists proce_reporte_servicio;
	drop procedure if exists proce_reporte_carrera;
drop procedure if exists proce_crear_usuario;
drop procedure if exists proce_iniciar_secion;

DELIMITER $$
CREATE PROCEDURE proce_nuevo_servicio(
	in in_nombre VARCHAR(110),
    in in_estado CHAR(3)
)
	MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE pr_id_ser INT DEFAULT 0;
    DECLARE error_pk CONDITION FOR 1062;
    DECLARE error_chk CONDITION FOR 3819;
    DECLARE error_col CONDITION FOR 1406;
    DECLARE pr_error BOOLEAN DEFAULT false;
    DECLARE out_msj VARCHAR(50);
    DECLARE CONTINUE HANDLER FOR error_col
		BEGIN
			SET out_msj = concat(1406, ' La longitud del estado es incorrecta');
            SET pr_error = true;
        END;
    DECLARE CONTINUE HANDLER FOR error_chk
		BEGIN
			SET out_msj = concat(3819, ' El valor del estado es incorrecto');
            SET pr_error = true;
        END;
    DECLARE CONTINUE HANDLER FOR error_pk
		BEGIN
			SET out_msj = concat(1062, ' Clave duplicada');
            SET pr_error = true;
        END;
    select 
		(count(idServicio) + 1) INTO pr_id_ser
    from servicio;
    SET @sql = NULL;
	SET @@autocommit = 0;
    START TRANSACTION;
		insert into servicio (idServicio, nombre, estado) values (pr_id_ser, in_nombre, in_estado);
    IF pr_error IS true THEN
		ROLLBACK;
	ELSE
		SET @sql = concat('alter table dataServicio add column serv', pr_id_ser,' INT NOT NULL DEFAULT 0');
		PREPARE add_colum FROM @sql;
		EXECUTE add_colum;
		SET @sql = NULL;
		COMMIT;
        SET out_msj = concat('Servicio: ',pr_id_ser, ' registrado');
	END IF;
    SET @@autocommit = 1;
    select out_msj from dual;
END $$

CREATE PROCEDURE proce_nueva_carrera(
	in in_nombre VARCHAR(260),
    in in_estado CHAR(3)
)
	MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE pr_id_car INT DEFAULT 0;
    DECLARE error_pk CONDITION FOR 1062;
    DECLARE error_chk CONDITION FOR 3819;
    DECLARE error_col CONDITION FOR 1406;
    DECLARE pr_error BOOLEAN DEFAULT false;
    DECLARE out_msj VARCHAR(50);
    DECLARE CONTINUE HANDLER FOR error_col
		BEGIN
			SET out_msj = concat(1406, ' La longitud del estado es incorrecta');
            SET pr_error = true;
        END;
    DECLARE CONTINUE HANDLER FOR error_chk
		BEGIN
			SET out_msj = concat(3819, ' El valor del estado incorrecto');
            SET pr_error = true;
        END;
    DECLARE CONTINUE HANDLER FOR error_pk
		BEGIN
			SET out_msj = concat(1062, ' Clave duplicada');
            SET pr_error = true;
        END;
    select (count(idCarrera) + 1) INTO pr_id_car from carrera;
    SET @sql = NULL;
	SET @@autocommit = 0;
    START TRANSACTION;
		insert into carrera (idCarrera, nombre, estado) values (pr_id_car, in_nombre, in_estado);
    IF pr_error IS true THEN
		ROLLBACK;
	ELSE
		SET @sql = concat('alter table dataCarrera add column carr', pr_id_car,' INT NOT NULL DEFAULT 0');
		PREPARE add_colum FROM @sql;
		EXECUTE add_colum;
		SET @sql = NULL;
		COMMIT;
        SET out_msj = concat('Carrera: ',pr_id_car, ' registrada');
	END IF;
    SET @@autocommit = 1;
    select out_msj from dual;
END $$

CREATE PROCEDURE proce_actualizar_visitas(
    in in_fecha_inicio DATE,
    in in_fecha_fin DATE
)
	MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE d_idVisita INT;
	DECLARE pr_done INT DEFAULT 0;
	DECLARE all_data CURSOR FOR
		select idVisita	from visita WHERE (fecha between in_fecha_inicio and in_fecha_fin) and estado != 'BLO';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET pr_done = 1;
    OPEN all_data;
	REPEAT
		FETCH all_data INTO d_idVisita;
		IF pr_done = 0 THEN
			update visita set estado = 'BLO' where idVisita = d_idVisita;
		END IF;		
		UNTIL pr_done = 1
	END REPEAT;
    CLOSE all_data;
END $$

CREATE PROCEDURE proce_reporte_servicio(
	in in_idReporte INT,
    in in_fecha_inicio DATE,
    in in_fecha_fin DATE
)
	MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE d_idServicio INT;
    DECLARE d_cantidad INT;
    DECLARE pr_done INT DEFAULT 0;
	DECLARE all_data CURSOR FOR
		select servicio.idServicio, count(servicio.idServicio) cantidad
		from visita join tienen on(visita.idVisita = tienen.idVisita)
			join servicio on(tienen.idServicio = servicio.idServicio)
		WHERE fecha between in_fecha_inicio and in_fecha_fin
			group by servicio.idServicio;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pr_done = 1;
    SET @sql = NULL;
	insert into dataServicio (idReporte) values (in_idReporte);
    OPEN all_data;
	REPEAT
		FETCH all_data INTO d_idServicio, d_cantidad;
        IF pr_done = 0 THEN
			SET @sql = NULL;
			SET @sql = concat('update dataServicio set ', 'serv',d_idServicio,' = ',d_cantidad,' where idReporte = ',in_idReporte);
			PREPARE add_regis FROM @sql;
			EXECUTE add_regis;
			SET @sql = NULL;
		END IF;
		UNTIL pr_done = 1
	END REPEAT;
    CLOSE all_data;
END $$

CREATE PROCEDURE proce_reporte_carrera(
	in in_idReporte INT,
    in in_fecha_inicio DATE,
    in in_fecha_fin DATE
)
	MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE d_idCarrera INT;
    DECLARE d_cantidad INT;
    DECLARE pr_done INT DEFAULT 0;
	DECLARE all_data CURSOR FOR
		select carrera.idCarrera, count(idVisita)
		from visita join alumno	on(visita.matricula = alumno.matricula)
			join carrera on(alumno.idCarrera = carrera.idCarrera)
		WHERE fecha between in_fecha_inicio and in_fecha_fin
			group by carrera.idCarrera;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pr_done = 1;
	SET @sql = NULL;
	insert into dataCarrera (idReporte) values (in_idReporte);
    OPEN all_data;
	REPEAT
		FETCH all_data INTO d_idCarrera, d_cantidad;
        IF pr_done = 0 THEN
			SET @sql = NULL;
			SET @sql = concat('update dataCarrera set ', 'carr',d_idCarrera,' = ',d_cantidad,' where idReporte = ',in_idReporte);
			PREPARE add_regis FROM @sql;
			EXECUTE add_regis;
			SET @sql = NULL;
		END IF;
		UNTIL pr_done = 1
	END REPEAT;
    CLOSE all_data;
END $$

CREATE PROCEDURE proce_reporte(
	in in_fecha DATE,
    in in_fecha_inicio DATE,
    in in_fecha_fin DATE,
    in in_idUsuario VARCHAR(12)
)
	MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE d_idReporte INT DEFAULT 0;
    DECLARE error_pk CONDITION FOR 1062;
    DECLARE error_chk CONDITION FOR 3819;
    DECLARE pr_error BOOLEAN DEFAULT false;
    DECLARE out_msj VARCHAR(50);
    DECLARE CONTINUE HANDLER FOR error_chk
		BEGIN
			SET out_msj = concat(3819, ' El valor del estado incorrecto');
            SET pr_error = true;
        END;
    DECLARE CONTINUE HANDLER FOR error_pk
		BEGIN
			SET out_msj = concat(1062, ' Clave duplicada');
            SET pr_error = true;
        END;
    select (count(*) + 1) INTO d_idReporte from reporte;
	SET @@autocommit = 0;
    START TRANSACTION;
	insert into reporte values (d_idReporte, in_fecha, in_fecha_inicio, in_fecha_fin, in_idUsuario);
    IF pr_error IS true THEN
		ROLLBACK;
	ELSE
		COMMIT;
		CALL proce_reporte_carrera(d_idReporte, in_fecha_inicio, in_fecha_fin);
		CALL proce_reporte_servicio(d_idReporte, in_fecha_inicio, in_fecha_fin);
		CALL proce_actualizar_visitas(in_fecha_inicio, in_fecha_fin);
		SET out_msj = concat('Reporte: ',d_idReporte, ' Completado');
	END IF;
    SET @@autocommit = 1;
    select out_msj from dual;
END $$

CREATE PROCEDURE proce_iniciar_secion(
    in in_idUsuario VARCHAR(12),
    in in_contra VARCHAR(20)
)
    DETERMINISTIC
BEGIN
    DECLARE pr_sec BOOLEAN DEFAULT false;
    DECLARE act INT DEFAULT 0;
    DECLARE pr_contra VARCHAR(20);
    select contra INTO pr_contra from usuario where (idUsuario = in_idUsuario and estado != 'BLO');
    IF pr_contra = in_contra THEN
		SET pr_sec = true;
        SET act = 1;
	ELSE
		SELECT act from dual;
	END IF;
    IF pr_sec = true THEN
		update usuario set estado = 'ACT' where (idUsuario = in_idUsuario and contra = in_contra);
		SELECT *, act FROM usuario WHERE idUsuario = in_idUsuario;
	END IF;
    
END $$

CREATE PROCEDURE proce_cerrar_secion(
    in in_idUsuario VARCHAR(12)
)
    DETERMINISTIC
    MODIFIES SQL DATA
BEGIN
    DECLARE pr_sec BOOLEAN DEFAULT false;
    update usuario set estado = 'IAC' where (idUsuario = in_idUsuario);
END $$
DELIMITER ;

DROP ROLE IF EXISTS 'JEFE'@'%';
DROP ROLE IF EXISTS 'ENCARGADO'@'%';
DROP USER IF EXISTS 'normal'@'%';
DROP USER IF EXISTS 'Admin'@'%';

CREATE ROLE IF NOT EXISTS 'JEFE'@'%';
GRANT EXECUTE ON PROCEDURE biblioteca.proce_reporte TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE, INSERT ON biblioteca.reporte TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE, INSERT ON biblioteca.usuario TO 'JEFE'@'%' WITH GRANT OPTION;
# Generar reporte de carreras
GRANT EXECUTE ON PROCEDURE biblioteca.proce_reporte_carrera TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT ON biblioteca.carrera TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT ON biblioteca.alumno TO 'JEFE'@'%' WITH GRANT OPTION;
-- GRANT SELECT ON biblioteca.visita TO 'JEFE'@'%';
GRANT INSERT, UPDATE ON biblioteca.dataCarrera TO 'JEFE'@'%' WITH GRANT OPTION;
# Generar reporte de servicios
GRANT EXECUTE ON PROCEDURE biblioteca.proce_reporte_servicio TO 'JEFE'@'%' WITH GRANT OPTION;
-- GRANT SELECT ON biblioteca.visita TO 'JEFE'@'%';
GRANT SELECT ON biblioteca.tienen TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT ON biblioteca.servicio TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT INSERT, UPDATE ON biblioteca.dataServicio TO 'JEFE'@'%' WITH GRANT OPTION;
# actualizar el estado de la visita
GRANT EXECUTE ON PROCEDURE biblioteca.proce_actualizar_visitas TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE ON biblioteca.visita TO 'JEFE'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE, INSERT ON biblioteca.usuario TO 'JEFE'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- SHOW GRANTS FOR JEFE;
## procedimiento para crear usuarios y registrarlos


CREATE ROLE IF NOT EXISTS 'ENCARGADO'@'%';
GRANT EXECUTE ON PROCEDURE biblioteca.proce_nuevo_servicio TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON biblioteca.servicio TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT ALTER ON biblioteca.dataServicio TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT EXECUTE ON PROCEDURE biblioteca.proce_nueva_carrera TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON biblioteca.carrera TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT ALTER ON biblioteca.dataCarrera TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE ON biblioteca.visita TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE ON biblioteca.tienen TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE ON biblioteca.usuario TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON biblioteca.alumno TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT EXECUTE ON PROCEDURE biblioteca.proce_cerrar_secion TO 'ENCARGADO'@'%' WITH GRANT OPTION;
GRANT UPDATE ON biblioteca.usuario TO 'ENCARGADO'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS 'alumno'@'%' IDENTIFIED BY 'Alum5no';
GRANT SELECT ON biblioteca.alumno TO 'alumno'@'%';
GRANT SELECT ON biblioteca.carrera TO 'alumno'@'%'; # Nuevo
GRANT SELECT, INSERT, UPDATE ON biblioteca.visita TO 'alumno'@'%';
GRANT SELECT ON biblioteca.servicio TO 'alumno'@'%';
GRANT SELECT, INSERT ON biblioteca.tienen TO 'alumno'@'%';
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS 'normal'@'%' IDENTIFIED BY 'Nor5m@l';
GRANT EXECUTE ON PROCEDURE biblioteca.proce_iniciar_secion TO 'normal'@'%';
GRANT SELECT, UPDATE ON biblioteca.usuario TO 'normal'@'%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'normal'@'%';
##############################################################################################
insert into usuario values ('Admin', 'apePaterno', 'nombre', 'IAC', 'Itso@eh2020', 'ADM');
insert into usuario values ('encargado', 'apePaterno', 'nombre', 'IAC', 'Itso@eh2020', 'ENC');
##############################################################################################
CREATE USER 'Admin'@'%' IDENTIFIED BY 'Itso@eh2020';
GRANT ENCARGADO TO 'Admin'@'%';
GRANT JEFE TO 'Admin'@'%';
SET DEFAULT ROLE JEFE, ENCARGADO TO 'Admin'@'%';
FLUSH PRIVILEGES;
CREATE USER 'encargado'@'%' IDENTIFIED BY 'Itso@eh2020';
GRANT ENCARGADO TO 'encargado'@'%';
SET DEFAULT ROLE ENCARGADO TO 'encargado'@'%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'ENCARGADO'@'%';