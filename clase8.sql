insert into empleados (empleadoId, nombre, departamentoID)
values
(1,"Juan",1),
(2,"Maria",2),
(3,"Carlos",1),
(4,"Ana",3);

select * from empleados 

create table departamentos(
departamentoID int primary key,
nombre varchar(50)
)

insert into departamentos (departamentoID, nombre)
values
(1,"Ventas"),
(2,"Marketing"),
(3,"IT");

SELECT * FROM  empleados 
SELECT * FROM departamentos 

-- consulta con inner join para obtener empleados y deptos

Select e.nombre as nombre_empleado, d.nombre as nombre_departamento
from empleados e 
inner join departamentos d on e.departamentoID  = d.departamentoID; 

-- crear tabla ciudades
create table ciudades(
ciudadId int primary key,
nombre varchar(50)
);

-- insertamos ciudades
insert into ciudades(ciudadId, nombre)
values
(1, "Nueva York"),
(2, "Corrientes"),
(3, "Buenos Aires"),
(4, "Villa Lugano");

-- crear relacion entre empleado y ciudad
alter table empleados add column  idCiudad int

-- update relaciones
update empleados set idCiudad= 1 where empleadoId =1
update empleados set idCiudad= 2 where empleadoId =2
update empleados set idCiudad= 3 where empleadoId =3
update empleados set idCiudad= 4 where empleadoId =4

-- consulta con inner join para obtener empleado ,ciudad y depto
Select e.nombre as nombre_empleado, d.nombre as nombre_departamento, c.nombre as ciudad
from empleados e 
inner join departamentos d on e.departamentoID  = d.departamentoID
inner join ciudades c on e.idCiudad = c.ciudadId

-- inserto nuevos empleados que no declararon aun su domicilio
insert into empleados (empleadoId, nombre, departamentoID)
values
(5,"Matias",1),
(6,"Soledad",2),
(7,"Ramiro",1),
(8,"Camila",3);

SELECT * FROM  empleados 

-- misma consulta, pero que si el empleado no tiene asignada la ciudad me traiga igual los datos
Select e.nombre as nombre_empleado, d.nombre as nombre_departamento, IFNULL(c.nombre,"No asignada") as ciudad
from empleados e 
inner join departamentos d on e.departamentoID  = d.departamentoID
left join ciudades c on e.idCiudad = c.ciudadId

-- necesito ver todas las ciudades y los empleados que trabajan en cada una, incluso si no hay empleadps asignados a algunas ciudades
insert into ciudades(ciudadId, nombre)
values
(5, "Chicago"),
(6, "Misiones"),
(7, "Santa Fe"),
(8, "Mercedes")


select c.nombre as nombreCiudad, e.nombre as nombreEmpleado
from empleados e 
right join ciudades c on e.idCiudad = c.ciudadId ;



