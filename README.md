# Prueba3


create table Usuarios(
usuario_id int(10) primary key not null auto_increment,
usuario varchar(25),
clave varchar(25),
fecha_nacimiento date,
estado varchar(25));

create table Vehiculos(
vehiculo_id int(10) primary key not null auto_increment,
tipo varchar(25),
patente varchar(25),
fecha_creacion date,
modelo_id int(10),
estado varchar(25),
creado_por varchar(25));

create table Modelos(
modelo_id int(10) primary key not null auto_increment,
nombre varchar(25),
marca_id int(10),
estado varchar(25));

create table Marcas(
marca_id int(10) primary key not null auto_increment,
nombre varchar(25),
estado varchar(25));
