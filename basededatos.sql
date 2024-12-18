CREATE DATABASE aereoport;

--itne un atributo "filial" el cual depende de si mismo para controlarse(no entendi tampoco) y pertenece a varios aviones
CREATE TABLE compañia{
    nombre VARCHAR(50),
    code3
    icao
    pais
    IATA
}

--pertenece a una compañia y hace un vuelo o mas
CREATE TABLE avion{
    num_serie
    tipo
    fabricante
    año_fabricacion
}

--conecta con mostrador y conecta con vuelo. con vuelo tiene dos conexiones, origen y destino
CREATE TABLE aereopuerto{
    codi
    pais
    ciudad
    IATA
    nombre
    año_construccion

}

--conectada a aereopuerto (tenir)
CREATE TABLE mostrador{
    numero 

}


--tiene dos atributos que son entidades (es una disjuntiva)
CREATE TABLE personal{
    num_empleado
    nombre
    apellido
    pasaporte
    sueldo

}

--pertenece a disjuntiva total
CREATE TABLE hostesa{


}

--pertenece a disjuntiva total de personal
CREATE TABLE piloto{
    horas_voladas
}


CREATE TABLE pasajero{
    pasaporte
    nombre
    apellido
    direccion
    telefono
    email
    fecha_nacimiento DATE
    genero

}
CREATE TABLE vuelo{
    codigo
    tiempo
    descripcion
}

