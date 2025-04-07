create database BDDataVerse;
use BDDataVerse;

create table Sensores(
idSensor int auto_increment primary key,
tipo varchar (60) not null,
ubicacion varchar (50) not null,
fechaInstalacion date not null
);


create table RegistroSensores(
idRegistro int auto_increment primary key,
valor float not null,
fechaRegistro timestamp not null,
idSensorFK int not null,
foreign key (idSensorFK) references Sensores(idSensor) on delete cascade on update cascade
);

create table Transporte(
idTransporte int auto_increment primary key,
tipo varchar (50) not null,
capacidad int not null
);

create table Usuario(
idUsuario int auto_increment primary key,
nombreUsu varchar (60) not null,
emailUsu varchar (70) not null,
idTransporteFK int not null,
foreign key (idTransporteFK) references Transporte(idTransporte) on delete cascade on update cascade
);


create table Consumo(
idRegistroFK int not null,
foreign key (idRegistroFK) references RegistroSensores(idRegistro) on delete cascade on update cascade,
idUsuarioFK int not null,
foreign key (idUsuarioFK) references Usuario(idUsuario) on delete cascade on update cascade,
zona varchar (60) not null,
consumoKw float not null,
fecha date
);



create table Seguridad(
idEvento int auto_increment primary key,
tipoEvento varchar (60) not null,
descrpcion varchar (80) not null,
fechaHora datetime,
idUsuarioFK int not null,
foreign key (idUsuarioFK) references Usuario(idUsuario) on delete cascade on update cascade
);


alter table Usuario add telefono varchar (50) not null;



/*Registros*/

insert into Sensores(idSensor, tipo, ubicacion, fechaInstalacion)
values(1, 'temperatura', 'centro', '2019-02-03'), (2, 'aire', 'sur', '2022-07-28'),
(3, 'aire', 'noroccidente', '2017-10-12'), (4, 'aire', 'norte', '2025-01-15'),
(5, 'temperatura', 'noroeste', '2012-11-02');

insert into RegistroSensores(idRegistro, valor, fechaRegistro, idSensorFK)
values(1, 30.2, '2019-02-03', 1), (2, 2.04, '2022-07-28', 2),
(3, 'aire', 'noroccidente', '2017-10-12'), (4, 'aire', 'norte', '2025-01-15'),
(5, 'temperatura', 'noroeste', '2012-11-02');

insert into RegistroSensores(idRegistro, valor, fechaRegistro, idSensorFK)
values(1, 30.2, '2019-02-03', ), (2, 'aire', 'sur', '2022-07-28'),
(3, 'aire', 'noroccidente', '2017-10-12'), (4, 'aire', 'norte', '2025-01-15'),
(5, 'temperatura', 'noroeste', '2012-11-02');



DELIMITER //
create procedure InsertarRegistroSensor(in idRegistro int, valor float, in fecharRegistro date, in idSensorFK int)
BEGIN
	insert into RegistroSensor(idRegistro, valor, fechaRegistro, idSensorFK)
	values(idRegistro, valor, fechaRegistro, idSensorFK);
END //
DELIMITER ;

call InsertarRegistroSensor(1, 32.3, '2025-03-12', 1);


delete from Seguridad where fechaHora < '2024-04-06';

















