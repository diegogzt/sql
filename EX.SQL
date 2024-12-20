CREATE DATABASE casasEstudiante;
use casasEstudiante;
CREATE TABLE estudiante(
    id int,
    nom char(20),
    año int(- 9)
    CONSTRAINT pk_estudiante PRIMARY KEY(id,)
)
CREATE TABLE casa(
    id int PRIMARY KEY,
    nom char(50),

)
