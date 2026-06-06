Create database dbCinemaxCesde

use dbCinemaxCesde

create table tblPeliculas(
IdPeliculas int primary key identity (1,1),
Titulo Varchar (50) unique not null,
Duración time not null
)

create table tblClasificación(
IdClasificación int primary key identity (1,1),
Clasificación Varchar (20)
)

create table tblGenero(
IdGenero int primary key identity (1,1),
Genero Varchar (15)
)

CREATE TABLE tblSalas (
    salaID INT PRIMARY KEY,
    capacidad INT
)


CREATE TABLE tblFunciones (
    IDFuncion INT PRIMARY KEY IDENTITY(1,1),
    Horario VARCHAR(30) NOT NULL,
    
    IDPeliculas INT,
    SalaID INT,

    CONSTRAINT fk_Funciones_Peliculas
        FOREIGN KEY (IDPeliculas)
        REFERENCES tblPeliculas(IDPeliculas),

    CONSTRAINT fk_Funciones_Salas
        FOREIGN KEY (SalaID)
        REFERENCES tblSalas(SalaID)

);

select * from tblFunciones

CREATE TABLE tblPrecios (
    IDPrecio INT PRIMARY KEY IDENTITY(1,1),
    Precio_base MONEY NOT NULL,

    IdClasificación INT,
    IDGenero INT,

    CONSTRAINT fk_Precios_Clasificacion
        FOREIGN KEY (IdClasificación)
        REFERENCES tblClasificación(IdClasificación),

    CONSTRAINT fk_Precios_Genero
        FOREIGN KEY (IDGenero)
        REFERENCES tblGenero(IDGenero)
);

CREATE TABLE tblClientes (
    IDCliente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE tblTickets (
    IDTicket INT PRIMARY KEY IDENTITY(1,1),

    IDCliente INT NOT NULL,
    IDFuncion INT NOT NULL,
    NumeroAsiento VARCHAR(10) NOT NULL,

    CONSTRAINT fk_Tickets_Clientes
        FOREIGN KEY (IDCliente)
        REFERENCES tblClientes(IDCliente),

    CONSTRAINT fk_Tickets_Funciones
        FOREIGN KEY (IDFuncion)
        REFERENCES tblFunciones(IDFuncion)
);

INSERT INTO tblPeliculas 
(Titulo, Duración)
VALUES 
('The Ugly','01:02:00'),
('Hoppers','01:05:00'),
('La Última Noche','01:45:00'),
('Robot Dreams','01:30:00'),
('Sombras del Pasado','02:10:00'),
('Mundo Fantasia','01:20:00'),
('Guardianes del Tiempo','02:00:00'),
('El Viaje Infinito','01:55:00'),
('Código Eclipse','02:05:00'),
('Aventura Polar','01:35:00'),
('Destino Final','01:50:00'),
('Ciudad Perdida','02:15:00'),
('Sueños de Cristal','01:40:00'),
('Horizonte Rojo','02:08:00'),
('El Último Guerrero','01:58:00'),
('Luz en la Oscuridad','01:32:00'),
('Proyecto Omega','02:12:00'),
('Noche de Misterio','01:47:00'),
('Rescate Extremo','01:53:00'),
('Universo Paralelo','02:03:00');

select * from tblPeliculas

INSERT INTO tblClasificación
(Clasificación)
VALUES
('Para todo público'),
('7 años'),
('10 años'),
('12 años'),
('13 años'),
('15 años'),
('16 años'),
('18 años'),
('Mayores de edad'),
('Familiar'),
('Adolescentes'),
('Adultos'),
('Infantil'),
('Supervisión parental'),
('Contenido sensible');

select * from tblClasificación

INSERT INTO tblGenero
(Genero)
VALUES
('Acción'),
('Drama'),
('Comedia'),
('Terror'),
('Romance'),
('Aventura'),
('Fantasía'),
('Ciencia ficción'),
('Documental'),
('Musical');

select * from tblGenero

INSERT INTO tblPrecios (Precio_base, IdClasificación, IDGenero) VALUES
(12000, 1, 1),
(13000, 2, 2),
(11000, 1, 3),
(14000, 3, 2),
(15000, 2, 1),
(12500, 1, 2),
(13500, 3, 3),
(14500, 2, 2),
(15500, 1, 1),
(16000, 3, 3),
(12000, 2, 2),
(13000, 1, 1),
(11000, 3, 2),
(14000, 2, 3),
(15000, 1, 2),
(12500, 3, 1),
(13500, 2, 3),
(14500, 1, 2),
(15500, 3, 1),
(16000, 2, 2);

select * from tblPrecios

INSERT INTO tblGenero
(Genero)
VALUES
('Acción'),
('Drama'),
('Comedia'),
('Terror'),
('Romance'),
('Aventura'),
('Fantasía'),
('Ciencia ficción'),
('Documental'),
('Musical');

select * from tblGenero

INSERT INTO tblClientes (IDCliente,Nombre, Correo) VALUES
( '1001234567','Juan Pérez', 'juan.perez@gmail.com'),
('1001234568','María Gómez', 'maria.gomez@gmail.com'),
('1001234569','Carlos Rodríguez', 'carlos.rodriguez@gmail.com'),
('1001234570','Ana López', 'ana.lopez@gmail.com'),
('1001234571','Luis Martínez', 'luis.martinez@gmail.com'),
('1001234572','Sofía Herrera', 'sofia.herrera@gmail.com'),
('1001234573','Andrés Castro', 'andres.castro@gmail.com'),
('1001234574','Valentina Ríos', 'valentina.rios@gmail.com'),
('1001234575','Diego Fernández', 'diego.fernandez@gmail.com'),
('1001234576','Laura Torres', 'laura.torres@gmail.com'),
('1001234577','Javier Ruiz', 'javier.ruiz@gmail.com'),
('1001234578','Camila Vargas', 'camila.vargas@gmail.com'),
('1001234579','Sebastián Molina', 'sebastian.molina@gmail.com'),
('1001234580','Paula Díaz', 'paula.diaz@gmail.com'),
('1001234581','Mateo Ramírez', 'mateo.ramirez@gmail.com'),
('1001234582','Isabella Suárez', 'isabella.suarez@gmail.com'),
('1001234583','Daniela Mejía', 'daniela.mejia@gmail.com'),
('1001234584','Miguel Ángel Cruz', 'miguel.cruz@gmail.com'),
('1001234585','Natalia Ortega', 'natalia.ortega@gmail.com'),
('1001234586','Santiago Herrera', 'santiago.herrera@gmail.com');

select * from tblClientes


select * from tblTickets

INSERT INTO tblSalas (salaID, Capacidad) VALUES
(1, 80),
(2, 90),
(3, 100),
(4, 75),
(5, 60),
(6, 120),
(7, 40),
(8, 35),
(9, 150),
(10, 50);


INSERT INTO tblFunciones (Horario, IDPeliculas, SalaID) VALUES
('10:00 AM', 1, 1),
('12:00 PM', 2, 2),
('02:00 PM', 3, 3),
('04:00 PM', 4, 4),
('06:00 PM', 5, 5),
('08:00 PM', 6, 1),
('10:00 PM', 7, 2),
('11:30 AM', 8, 3),
('01:30 PM', 9, 4),
('03:30 PM', 10, 5),
('05:30 PM', 1, 2),
('07:30 PM', 2, 3),
('09:30 PM', 3, 4),
('11:00 AM', 4, 5),
('01:00 PM', 5, 1),
('03:00 PM', 6, 2),
('05:00 PM', 7, 3),
('07:00 PM', 8, 4),
('09:00 PM', 9, 5),
('11:00 PM', 10, 1);

select * from tblFunciones

SET IDENTITY_INSERT tblTickets ON;

INSERT INTO tblTickets (IDTicket, IDCliente, IDFuncion, NumeroAsiento) VALUES
(1, '1001234567', 11, 'A1'),
(2, '1001234568', 11, 'A2'),
(3, '1001234569', 2, 'B1'),
(4, '1001234570', 2, 'B2'),
(5, '1001234571', 3, 'C1'),
(6, '1001234572', 3, 'C2'),
(7, '1001234573', 4, 'A3'),
(8, '1001234574', 4, 'A4'),
(9, '1001234575', 5, 'B3'),
(10, '1001234576', 5, 'B4'),
(11, '1001234577', 6, 'C3'),
(12, '1001234578', 6, 'C4'),
(13, '1001234579', 7, 'A5'),
(14, '1001234580', 7, 'A6'),
(15, '1001234581', 8, 'B5'),
(16, '1001234582', 8, 'B6'),
(17, '1001234583', 9, 'C5'),
(18, '1001234584', 9, 'C6'),
(19, '1001234585', 10, 'A7'),
(20, '1001234586', 10, 'A8');

SET IDENTITY_INSERT tblTickets OFF;

select * from tblTickets


--PROCEDIMIENTO PARA ver los tickets vendidos


CREATE PROCEDURE TicketsVendidos
AS
BEGIN
    SELECT
        T.IDTicket,
        C.Nombre,
        P.Titulo,
        F.Horario,
        T.NumeroAsiento
    FROM tblTickets T
    INNER JOIN tblClientes C
        ON T.IDCliente = C.IDCliente
    INNER JOIN tblFunciones F
        ON T.IDFuncion = F.IDFuncion
    INNER JOIN tblPeliculas P
        ON F.IDPeliculas = P.IdPeliculas
END

exec TicketsVendidos



--PROCEDIMIENTO PARA REGISTRO DE CLIENTES

CREATE PROCEDURE sp_RegistrarCliente
(
    @IDCliente INT,
    @Nombre VARCHAR(100),
    @Correo VARCHAR(150)
)
AS
BEGIN
    INSERT INTO tblClientes
    VALUES
    (
        @IDCliente,
        @Nombre,
        @Correo
    )
END

EXEC sp_RegistrarCliente
'1017185737',
'Paola Salgado',
'Psalgado@gmail.com'
