create database dbacademico;
use dbacademico;




CREATE TABLE sexo (
idsexo int not null primary key auto_increment,
nombre varchar(50),
eliminado TINYINT(1) DEFAULT 0
);

CREATE TABLE tiposangre (
idtiposangre int not null primary key auto_increment,
nombre varchar(50),
eliminado TINYINT(1) DEFAULT 0
);

CREATE TABLE estadocivil(
idestadocivil int not null primary key auto_increment,
nombre varchar(50),
eliminado TINYINT(1) DEFAULT 0
) ;

CREATE TABLE persona (
idpersona int NOT NULL primary key auto_increment,
nombres varchar(50),
apellidos varchar(50),
fechanacimiento date,
fechadefuncion date,
idsexo int default 1,
idtiposangre int default 1,
idestadocivil int default 1,
eliminado TINYINT(1) DEFAULT 0,
FOREIGN KEY (idsexo) REFERENCES sexo(idsexo),
FOREIGN KEY (idestadocivil) REFERENCES estadocivil(idestadocivil),
FOREIGN KEY (idtiposangre) REFERENCES tiposangre(idtiposangre)
);


CREATE TABLE direccion (
iddireccion int not null primary key auto_increment,
nombre varchar(200),
idpersona int,
eliminado TINYINT(1) DEFAULT 0,
FOREIGN KEY (idpersona) REFERENCES persona(idpersona)
);

CREATE TABLE telefono (
idtelefono int not null primary key auto_increment,
nombre varchar(50),
idpersona int,
eliminado TINYINT(1) DEFAULT 0,
FOREIGN KEY (idpersona) REFERENCES persona(idpersona)
);
INSERT INTO persona (nombres, apellidos, fechanacimiento, fechadefuncion, idsexo, idtiposangre, idestadocivil) VALUES ('José Miguel', 'Porozo Caicedo', '2023-09-04', '2150-02-24', 1, 1, 1);

INSERT INTO sexo (nombre) VALUES ('Masculino');

INSERT INTO sexo (nombre) VALUES ('Femenino');

INSERT INTO tiposangre (nombre) VALUES ('O+');
INSERT INTO tiposangre (nombre) VALUES ('A-');
INSERT INTO tiposangre (nombre) VALUES ('B+');
INSERT INTO tiposangre (nombre) VALUES ('B-');
INSERT INTO tiposangre (nombre) VALUES ('AB+');
INSERT INTO tiposangre (nombre) VALUES ('AB-');
INSERT INTO tiposangre (nombre) VALUES ('O-');

INSERT INTO estadocivil (nombre) VALUES ('Soltero/a');

INSERT INTO estadocivil (nombre) VALUES ('Casado/a');
CREATE VIEW vista_personas AS
SELECT
    persona.nombres,
    persona.apellidos,
    persona.fechanacimiento,
    persona.fechadefuncion,
    sexo.nombre AS sexo,
    tiposangre.nombre AS tiposangre,
    estadocivil.nombre AS estadocivil
FROM
    persona
    INNER JOIN sexo ON persona.idsexo = sexo.idsexo
    INNER JOIN tiposangre ON persona.idtiposangre = tiposangre.idtiposangre
    INNER JOIN estadocivil ON persona.idestadocivil = estadocivil.idestadocivil;


-- Crear tabla cliente
CREATE TABLE cliente (
  idcliente INT PRIMARY KEY,
  tipocliente VARCHAR(50),
  eliminado TINYINT(1) DEFAULT 0,
  FOREIGN KEY (idcliente) REFERENCES persona(idpersona)
);
CREATE TABLE proveedor (
  idproveedor INT PRIMARY KEY,
  tipoproveedor VARCHAR(50),
  eliminado TINYINT(1) DEFAULT 0,
  FOREIGN KEY (id_proveedor) REFERENCES persona(idpersona)
);
CREATE TABLE factura (
  idfactura INT PRIMARY KEY,
  idcliente INT,
  idproveedor INT,
  fechaemision DATE,
  fechavencimiento DATE,
  totalfactura FLOAT,
valorbruto FLOAT,
valorfinal FLOAT,
porcentajeiva FLOAT,
Porcentajedescuento FLOAT,
eliminado TINYINT(1) DEFAULT 0,
  FOREIGN KEY (idcliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor)
);
CREATE TABLE detallefactura (
  iddetallefactura INT PRIMARY KEY,
  idfactura INT,
  idproducto INT,
    eliminado TINYINT(1) DEFAULT 0,
precio FLOAT,
cantidad INT,
  FOREIGN KEY (idfactura) REFERENCES factura(idfactura),
  FOREIGN KEY (idproducto) REFERENCES producto(idproducto)
);

CREATE TABLE producto (
  idproducto INT PRIMARY KEY,
  nombre VARCHAR(50),
  idtipoproducto INT,
  eliminado TINYINT(1) DEFAULT 0,
  Stock INT,

);
CREATE TABLE tipoproducto (
  idtipoproducto INT PRIMARY KEY,
   eliminado TINYINT(1) DEFAULT 0,
  nombre VARCHAR(50),
FOREIGN KEY (idtipoproducto) REFERENCES producto(idtipoproducto)
);
