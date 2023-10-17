create database dbacademico;
use dbacademico;




CREATE TABLE sexo (
idsexo int not null primary key auto_increment,
nombre varchar(50)
);

CREATE TABLE tiposangre (
idtiposangre int not null primary key auto_increment,
nombre varchar(50)
);

CREATE TABLE estadocivil(
idestadocivil int not null primary key auto_increment,
nombre varchar(50)
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
FOREIGN KEY (idsexo) REFERENCES sexo(idsexo),
FOREIGN KEY (idestadocivil) REFERENCES estadocivil(idestadocivil),
FOREIGN KEY (idtiposangre) REFERENCES tiposangre(idtiposangre)
);


CREATE TABLE direccion (
iddireccion int not null primary key auto_increment,
nombre varchar(200),
idpersona int,
FOREIGN KEY (idpersona) REFERENCES persona(idpersona)
);

CREATE TABLE telefono (
idtelefono int not null primary key auto_increment,
nombre varchar(50),
idpersona int,
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
