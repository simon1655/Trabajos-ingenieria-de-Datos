CREATE DATABASE votaciones2503816;
USE  votaciones2503816;

/*CREACION DE LAS TABLAS*/

CREATE TABLE Curso(
idCurso INT PRIMARY KEY,
nomCurso VARCHAR(30),
estadoCu BOOL 
);

CREATE TABLE Genero(
idGenero INT PRIMARY KEY,
nomGenero VARCHAR (30),
estadoG BOOLEAN
);


CREATE TABLE TipoDocumento(
idTipoDoc INT PRIMARY KEY,
nomTipoDoc VARCHAR (30),
estadoTD BOOLEAN
);


CREATE TABLE TipoMiembro(
idTipoMiembro INT PRIMARY KEY,
nomTipoMiembro VARCHAR (30),
estadoTM BOOLEAN
);


CREATE TABLE Jornada(
idJornada INT PRIMARY KEY,
nomJornada VARCHAR (30),
estadoJ BOOLEAN
);


CREATE TABLE Consejo(
idConsejo INT PRIMARY KEY,
nomConsejo VARCHAR (30),
estadoCO BOOLEAN
);


CREATE TABLE Cargo(
idCargo INT PRIMARY KEY,
nomCargo VARCHAR (30),
idConsejoFK INT,
estadoC BOOLEAN
);

CREATE TABLE Eleccion(
idEleccion INT PRIMARY KEY,
fechaEleccion DATE,
anoEleccion YEAR,
estadoEL BOOLEAN
);

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY,
noDocUsuario VARCHAR (40),
nombreUsuario VARCHAR (30),
apellidoUsuario VARCHAR (30),
idGeneroFK INT,
fechaNacUsuario DATE,
emailUsuario VARCHAR (40),
passwordUsuario VARCHAR (40),
idJornadaFK INT,
idTipoMiembroFK INT,
idCursoFK INT,
estadoU BOOLEAN,
idTipoDocFK INT
);

CREATE TABLE Votacion(
idVotacion INT PRIMARY KEY,
horaVotacion TIME,
idUsuarioVotanteFK INT,
idPostCandidatoFK INT,
estadoV BOOLEAN
);

CREATE TABLE PostulacionCandidato(
idPostCandidato INT PRIMARY KEY,
idUsuarioFK INT,
idEleccionFK INT,
idCargoFK INT,
propuestas VARCHAR (70),
totalVotos int,
estadoCan BOOLEAN
);

/*CREACION DE LAS REALCIONES*/
ALTER TABLE Cargo ADD CONSTRAINT FKCargoConsejo FOREIGN KEY(idConsejoFK) REFERENCES Consejo(idConsejo);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuarioGenero FOREIGN KEY(idGeneroFK) REFERENCES Genero(idGenero);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuarioJornada FOREIGN KEY(idJornadaFK) REFERENCES Jornada(idJornada);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuarioCurso FOREIGN KEY(idCursoFK) REFERENCES Curso(idCurso);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuarioTipoDocumento FOREIGN KEY(idTipoDocFK) REFERENCES TipoDocumento(idTipoDoc);
ALTER TABLE Usuario ADD CONSTRAINT FKUsuarioTipoMiembro FOREIGN KEY(idTipoMiembroFK) REFERENCES TipoMiembro(idTipoMiembro);
ALTER TABLE Votacion ADD CONSTRAINT FKVotacionUsuario FOREIGN KEY(idUsuarioVotanteFK) REFERENCES Usuario(idUsuario);
ALTER TABLE Votacion ADD CONSTRAINT FKVotacionPostCandidato FOREIGN KEY(idPostCandidatoFK) REFERENCES PostulacionCandidato(idPostCandidato);
ALTER TABLE PostulacionCandidato ADD CONSTRAINT FKPostulacionCandidatoUsuario FOREIGN KEY(idUsuarioFK) REFERENCES Usuario(idUsuario);
ALTER TABLE PostulacionCandidato ADD CONSTRAINT FKPostulacionCandidatoEleccion FOREIGN KEY(idEleccionFK) REFERENCES ELeccion(idEleccion);
ALTER TABLE PostulacionCandidato ADD CONSTRAINT FKPostulacionCandidatoCargo FOREIGN KEY(idCargoFK) REFERENCES Cargo(idCargo);

/*INSERCIONES*/

INSERT INTO Curso(idCurso, nomCurso, estadoCU)
VALUES(1,'901',true), (2,'902',true), (3,'1001',true), (4,'1002',true), (5,'1003',false),
(6,'1101',true), (7,'1102',true), (8,'1103',false);

INSERT INTO Genero(idGenero, nomGenero, estadoG)
VALUES(1,'Femenino',true), (2,'Masculino',true);

INSERT INTO TipoDocumento(idTipoDoc, nomTipoDoc, estadoTD)
VALUES(1,'Tarjeta de Identidad'true), (2,'Cédula Ciudadanía',true), (3,'Cédula Extranjeria',true),
(4,'Pasaporte',true), (5,'NUIP',false);

INSERT INTO TipoMiembro(idTipoMiembro, nomTipoMiembro, estadoTM)
VALUES(1,'Estudiante',true), (2,'Profesor',true), (3,'Acudiente',true);

INSERT INTO Jornada(idJornada, nomJornada, estadoJ)
VALUES(1,'Mañana',true), (2,'Tarde',true), (3,'Noche',true);

INSERT INTO Consejo(idConsejo, nomConsejo, estadoCO)
VALUES(1,'Concejo Académico',true), (2,'Concejo Directivo',true), (3,'Concejo Convivencia',true);

INSERT INTO Cargo(idCargo, nomCargo, idConsejoFK, estadoC)
VALUES(1,'Personero',1,true), (2,'Contralor',1,true), (3,'Cabildante',1,true);

INSERT INTO Eleccion(idEleccion, fechaEleccion, anoEleccion, estadoEL)
VALUES(1,2020-04-20,2020,true), (2,2019-04-15,2019,true), (3,2019-04-12,2019,false),
(4,2018-04-14,2018,true), (5,2017-04-12,2017,true);

INSERT INTO Usuario(idUsuario, noDocUsuario, nombreUsuario, apellidoUsuario, idGeneroFK, 
fechaNacUsuario, emailUsuario, passwordUsuario, idJornadaFK, idTipoMiembroFK, idCursoFK,
estadoU, idTipoDocFK)
VALUES(1, '1', 1, 'VOTO', 'BLANCO', 2, '0000-00-00', NULL, NULL, 1, 1, 3, true),
(2, '1010123456', 1, 'DAVID SANTIAGO', 'LÓPEZ MORA', 2, '2004-10-11', 'davidLopez456@hotmail.com', 'David2004', 1, 1, 1, true),
(3, '1010123789', 1, 'LAURA MILENA', 'GOMEZ BONILLA', 1, '2004-03-17', 'lauragomez@gmail.com', 'Gomez2004', 1, 1, 1, true),
(4, '1010123741', 1, 'DIEGO FERNANDO', 'CAÑON VARGAS', 2, '2003-05-20', 'diegocanon@hotmail.com', 'Diego2003', 1, 1, 1, true),
(5, '1010123852', 1, 'TATIANA', 'VARGAS CABRERA', 1, '2003-11-28', 'tatacabrera@gmail.com', 'Cabrera2003', 1, 1, 3, true),
(6, '1010123963', 1, 'LEYDY KATHERINE', 'FERNANDEZ RODRIGUEZ', 1, '2004-06-28', 'leydy2004@gmail.com', 'Leydy2004', 1, 1, 4, true),
(7, '1010123654', 2, 'MAURICIO', 'BERMUDEZ AMAYA', 2, '2002-01-26', 'maobermudez@gmail.com', 'Amaya2002', 1, 1, 4, true),
(8, '1010741258', 1, 'ANDRES FELIPE', 'RODRIGUEZ PEREZ', 2, '2004-03-23', 'andyrodriguez@gmail.com', 'Arodriguez2004', 1, 1, 3, true),
(9, '1010236859', 1, 'MARIA ANGÉLICA', 'TRIVIÑO LATORRE', 1, '2002-02-04', 'angelicatri@gmail.com', 'Trivino2002', 1, 1, 3, true),
(10, '1010236963', 1, 'GENARO', 'VASQUEZ RODRIGUEZ', 2, '2002-11-14', 'gevasquez@gmail.com', 'Vasquez123', 1, 1, 3, false);

INSERT INTO Votacion (idVotacion, horaVotacion, idUsuarioVotanteFK, idPostCandidatoFK, estadoV)
VALUES (1, '12:08:15', 1, 1, true), (2, '12:12:35', 2, 3, true), (3, '12:14:18', 3, 2, true),
(4, '12:15:58', 4, 2, true), (5, '12:18:02', 5, 3, true), (6, '12:24:22', 6, 3, true),
(7, '12:28:02', 7, 3, true), (8, '12:30:14', 8, 2, true), (9, '12:40:20', 9, 2, true),
(10, '12:45:20', 10, 2, true);

INSERT INTO PostulacionCandidato (idPostCandidato, idUsuarioFK, idEleccionFK, idCargoFK, propuestas, totalVotos, estadoCan) 
VALUES (1, 1, 1, 1, 'Mejorar entrega refrigerios, Alargar descansos', 0, true),
(2, 5, 1, 1, 'Mejorar entrega refrigerios, Alargar descansos', 0, true),
(3, 7, 1, 1, 'Mejorar sala de informática, Construir piscina', 0, true);

/*REALIZE UNA CONSULTA QUE MUESTRE EL NOMBRE DE CADA CONSEGO, QUE TENGA ASIGANDOUN CARGO,
CON EL NOMBRE DEL CARGO, AL QUE PERTENECES Y EL ESTADO ACTUAL DEL MISMO*/
SELECT 
    Consejo.nomConsejo AS Nombre_Consejo, 
    Cargo.nomCargo AS Nombre_Cargo, 
    Cargo.estadoC AS Estado_Cargo
FROM Cargo
JOIN Consejo ON Cargo.idConsejoFK = Consejo.idConsejo;

/*realize una consulta que muestre el nombre de cada consejo, el nombre del cargo al que pertenece y 
el estado actual del mismo, tenga o no tenga cargo asignado*/
SELECT 
    Consejo.nomConsejo AS Nombre_Consejo, 
    Cargo.nomCargo AS Nombre_Cargo, 
    Cargo.estadoC AS Estado_Cargo
FROM Consejo
LEFT JOIN Cargo ON Consejo.idConsejo = Cargo.idConsejoFK;

/*Realice una consulta que muestre cada usuario con su jornada, tipo de miembro y curso*/
SELECT 
    Usuario.nombreUsuario AS Nombre, 
    Usuario.apellidoUsuario AS Apellido, 
    Jornada.nomJornada AS Jornada, 
    TipoMiembro.nomTipoMiembro AS Tipo_Miembro, 
    Curso.nomCurso AS Curso
FROM Usuario
JOIN Jornada ON Usuario.idJornadaFK = Jornada.idJornada
JOIN TipoMiembro ON Usuario.idTipoMiembroFK = TipoMiembro.idTipoMiembro
JOIN Curso ON Usuario.idCursoFK = Curso.idCurso;

/*Agregue el campo a la tabla estudiante llamada profesión*/
ALTER TABLE Usuario ADD profesion VARCHAR(50);

/*	Realice una consulta que muestre la cantidad de votos obtenidos por cada candidato 
en las votaciones registradas*/
SELECT 
    Usuario.nombreUsuario AS Nombre_Candidato, 
    Usuario.apellidoUsuario AS Apellido_Candidato, 
    COUNT(Votacion.idVotacion) AS Total_Votos
FROM PostulacionCandidato
JOIN Usuario ON PostulacionCandidato.idUsuarioFK = Usuario.idUsuario
LEFT JOIN Votacion ON PostulacionCandidato.idPostCandidato = Votacion.idPostCandidatoFK
GROUP BY Usuario.idUsuario, Usuario.nombreUsuario, Usuario.apellidoUsuario
ORDER BY Total_Votos DESC;

/*registrar un nuevo usuario*/
DELIMITER //
CREATE PROCEDURE RegistrarUsuario(
	IN p_idUsuario INT,
    IN p_noDocUsuario VARCHAR(40), 
    IN p_idTipoDocFK INT, 
    IN p_nombreUsuario VARCHAR(30), 
    IN p_apellidoUsuario VARCHAR(30), 
    IN p_idGeneroFK INT, 
    IN p_fechaNacUsuario DATE, 
    IN p_emailUsuario VARCHAR(40), 
    IN p_passwordUsuario VARCHAR(40), 
    IN p_idJornadaFK INT, 
    IN p_idTipoMiembroFK INT, 
    IN p_idCursoFK INT, 
    IN p_estadoU BOOLEAN
)
BEGIN
    INSERT INTO Usuario (idUsuario, noDocUsuario, idTipoDocFK, nombreUsuario, apellidoUsuario, idGeneroFK, fechaNacUsuario, emailUsuario, passwordUsuario, idJornadaFK, idTipoMiembroFK, idCursoFK, estadoU) 
    VALUES (p_idUsuario, p_noDocUsuario, p_idTipoDocFK, p_nombreUsuario, p_apellidoUsuario, p_idGeneroFK, p_fechaNacUsuario, p_emailUsuario, p_passwordUsuario, p_idJornadaFK, p_idTipoMiembroFK, p_idCursoFK, p_estadoU);
END //
DELIMITER ;

CALL RegistrarUsuario(11, '1010123999', 1, 'Carlos', 'Ramírez', 2, '2005-07-15', 'carlos.ramirez@gmail.com', 'Clave123', 1, 1, 2, true);
select * from Usuario;
/*registrar un voto*/
DELIMITER //
CREATE PROCEDURE RegistrarVoto(
	IN p_idVotacion INT,
    IN p_horaVotacion TIME, 
    IN p_idUsuarioVotanteFK INT, 
    IN p_idPostCandidatoFK INT
)
BEGIN
    INSERT INTO Votacion (idVotacion, horaVotacion, idUsuarioVotanteFK, idPostCandidatoFK, estadoV) 
    VALUES (p_idVotacion, p_horaVotacion, p_idUsuarioVotanteFK, p_idPostCandidatoFK, true);
END //
DELIMITER ;

CALL RegistrarVoto(11, '14:30:00', 11, 1);
select * from Votacion;

/*obtener la cantidad de votos por cada candidato*/
DELIMITER //
CREATE PROCEDURE ObtenerVotosCandidatos()
BEGIN
    SELECT 
        Usuario.nombreUsuario AS Nombre_Candidato, 
        Usuario.apellidoUsuario AS Apellido_Candidato, 
        COUNT(Votacion.idVotacion) AS Total_Votos
    FROM PostulacionCandidato
    JOIN Usuario ON PostulacionCandidato.idUsuarioFK = Usuario.idUsuario
    LEFT JOIN Votacion ON PostulacionCandidato.idPostCandidato = Votacion.idPostCandidatoFK
    GROUP BY Usuario.idUsuario, Usuario.nombreUsuario, Usuario.apellidoUsuario
    ORDER BY Total_Votos DESC;
END //
DELIMITER ;

CALL ObtenerVotosCandidatos();

/*vista de usuarios con su jornada, tipo de miembro y curso*/
CREATE VIEW Vista_Usuarios AS
SELECT 
    Usuario.idUsuario,
    Usuario.nombreUsuario,
    Usuario.apellidoUsuario,
    Jornada.nomJornada AS Jornada,
    TipoMiembro.nomTipoMiembro AS Tipo_Miembro,
    Curso.nomCurso AS Curso
FROM Usuario
LEFT JOIN Jornada ON Usuario.idJornadaFK = Jornada.idJornada
LEFT JOIN TipoMiembro ON Usuario.idTipoMiembroFK = TipoMiembro.idTipoMiembro
LEFT JOIN Curso ON Usuario.idCursoFK = Curso.idCurso;

SELECT * FROM Vista_Usuarios;


/*vista de elecciones activas*/
CREATE VIEW Vista_Elecciones_Activas AS
SELECT idEleccion, fechaEleccion, anoEleccion
FROM Eleccion
WHERE estadoEL = true;

SELECT * FROM Vista_Elecciones_Activas;

/*vista de candidatos con sus cargos y votos obtenidos*/
CREATE VIEW Vista_Candidatos_Votos AS
SELECT 
    Usuario.nombreUsuario AS Nombre_Candidato, 
    Usuario.apellidoUsuario AS Apellido_Candidato, 
    Cargo.nomCargo AS Cargo, 
    COUNT(Votacion.idVotacion) AS Total_Votos
FROM PostulacionCandidato
JOIN Usuario ON PostulacionCandidato.idUsuarioFK = Usuario.idUsuario
JOIN Cargo ON PostulacionCandidato.idCargoFK = Cargo.idCargo
LEFT JOIN Votacion ON PostulacionCandidato.idPostCandidato = Votacion.idPostCandidatoFK
GROUP BY Usuario.idUsuario, Usuario.nombreUsuario, Usuario.apellidoUsuario, Cargo.nomCargo;

SELECT * FROM Vista_Candidatos_Votos;

/*mostrar los usuarios que han votado y el total de votos registrados*/
SELECT 
    nombreUsuario, 
    apellidoUsuario, 
    (SELECT COUNT(*) FROM Votacion WHERE Votacion.idUsuarioVotanteFK = Usuario.idUsuario) AS Total_Votos_Emitidos
FROM Usuario
WHERE idUsuario IN (SELECT DISTINCT idUsuarioVotanteFK FROM Votacion);


/*obtener el candidato con más votos*/
SELECT nombreUsuario, apellidoUsuario, Total_Votos
FROM (
    SELECT 
        Usuario.nombreUsuario, 
        Usuario.apellidoUsuario, 
        COUNT(Votacion.idVotacion) AS Total_Votos
    FROM PostulacionCandidato
    JOIN Usuario ON PostulacionCandidato.idUsuarioFK = Usuario.idUsuario
    LEFT JOIN Votacion ON PostulacionCandidato.idPostCandidato = Votacion.idPostCandidatoFK
    GROUP BY Usuario.idUsuario, Usuario.nombreUsuario, Usuario.apellidoUsuario
    ORDER BY Total_Votos DESC
) AS Votos_Candidatos
LIMIT 1;










