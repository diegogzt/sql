DELETE DATABASE aereoport;
CREATE DATABASE IF NOT EXISTS aereoport;
USE aereoport;

DROP TABLE IF EXISTS companyia;
DROP TABLE IF EXISTS avio;
DROP TABLE IF EXISTS aeroport;
DROP TABLE IF EXISTS mostrador;
DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS hostessa;
DROP TABLE IF EXISTS pilot;
DROP TABLE IF EXISTS passatger;
DROP TABLE IF EXISTS vol;

CREATE TABLE companyia (
    nombre VARCHAR(50) NOT NULL,
    code3 CHAR(3),
    icao CHAR(4),
    pais VARCHAR(60),
    iata CHAR(3),
    PRIMARY KEY (nombre)
);

CREATE TABLE avio (
    num_serie INT NOT NULL,
    tipo VARCHAR(50),
    fabricante VARCHAR(100),
    any_fabricacion YEAR,
    PRIMARY KEY (num_serie)
);

CREATE TABLE aeroport (
    codi INT NOT NULL,
    pais VARCHAR(50),
    ciudad VARCHAR(50),
    IATA CHAR(3) NOT NULL,
    nombre VARCHAR(100),
    any_construccion YEAR,
    PRIMARY KEY (codi)
);

CREATE TABLE mostrador (
    numero INT NOT NULL,
    codi_aeroport INT,
    PRIMARY KEY (numero),
    FOREIGN KEY (codi_aeroport) REFERENCES aeroport(codi)
);

CREATE TABLE personal (
    num_empleado INT NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    pasaporte VARCHAR(20),
    sueldo DECIMAL(10, 2),
    PRIMARY KEY (num_empleado)
);

CREATE TABLE hostessa (
    num_empleado INT NOT NULL,
    PRIMARY KEY (num_empleado),
    FOREIGN KEY (num_empleado) REFERENCES personal(num_empleado)
);

CREATE TABLE pilot (
    num_empleado INT NOT NULL,
    horas_voladas INT,
    PRIMARY KEY (num_empleado),
    FOREIGN KEY (num_empleado) REFERENCES personal(num_empleado)
);

CREATE TABLE passatger (
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

CREATE TABLE vol (
    codigo VARCHAR(9) NOT NULL,
    tiempo TIME,
    descripcion VARCHAR(250),
    PRIMARY KEY (codigo)
);

