CREATE DATABASE IF NOT EXISTS aereoport;
USE aereoport;

DROP TABLE IF EXISTS compañia;
DROP TABLE IF EXISTS avion;
DROP TABLE IF EXISTS aereopuerto;
DROP TABLE IF EXISTS mostrador;
DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS hostesa;
DROP TABLE IF EXISTS piloto;
DROP TABLE IF EXISTS pasajero;
DROP TABLE IF EXISTS vuelo;

CREATE TABLE compañia (
    nombre VARCHAR(50) NOT NULL,
    code3 CHAR(3),
    icao CHAR(4),
    pais VARCHAR(60),
    iata CHAR(3),
    PRIMARY KEY (nombre)
);

CREATE TABLE avion (
    num_serie INT NOT NULL,
    tipo VARCHAR(50),
    fabricante VARCHAR(100),
    año_fabricacion YEAR,
    PRIMARY KEY (num_serie)
);

CREATE TABLE aereopuerto (
    codi INT NOT NULL,
    pais VARCHAR(50),
    ciudad VARCHAR(50),
    IATA CHAR(3) NOT NULL,
    nombre VARCHAR(100),
    año_construccion YEAR,
    PRIMARY KEY (codi)
);

CREATE TABLE mostrador (
    numero INT NOT NULL,
    codi_aereopuerto INT,
    PRIMARY KEY (numero),
    FOREIGN KEY (codi_aereopuerto) REFERENCES aereopuerto(codi)
);

CREATE TABLE personal (
    num_empleado INT NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pasaporte VARCHAR(20),
    sueldo DECIMAL(10, 2),
    PRIMARY KEY (num_empleado)
);

CREATE TABLE hostesa (
    num_empleado INT NOT NULL,
    PRIMARY KEY (num_empleado),
    FOREIGN KEY (num_empleado) REFERENCES personal(num_empleado)
);

CREATE TABLE piloto (
    num_empleado INT NOT NULL,
    horas_voladas INT,
    PRIMARY KEY (num_empleado),
    FOREIGN KEY (num_empleado) REFERENCES personal(num_empleado)
);

CREATE TABLE pasajero (
    pasaporte VARCHAR(20) NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    direccion VARCHAR(300),
    telefono VARCHAR(15),
    email VARCHAR(320),
    fecha_nacimiento DATE,
    genero CHAR(1),
    PRIMARY KEY (pasaporte)
);

CREATE TABLE vuelo (
    codigo VARCHAR(9) NOT NULL,
    tiempo TIME,
    descripcion VARCHAR(250),
    PRIMARY KEY (codigo)
);
