create table alumnos (legajo int primary key, nombre varchar(50), apellido varchar(50))

explain select * from alumnos a where a.apellido  = "k"

CREATE INDEX idx_alumnos_apellido on alumnos(apellido)

ALTER TABLE `bd-2`.alumnos
RENAME INDEX idx_alumnos_apellido TO idx_alumnos_apellidos;

-- ALTER TABLE `bd-2`.alumnos DROP INDEX idx_alumnos_apellidos;
/* DML*/
select * from alumnos a where a.apellido  = "Velasquez"
INSERT INTO `bd-2`.alumnos (legajo, nombre, apellido)VALUES(3, 'Juan', 'Peres');
UPDATE alumnos a set a.nombre ='Matias Alejandro' where a.legajo = 1 
DELETE FROM alumnos a where a.legajo = 3


CREATE TABLE alumnos_asignados (
   id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha_de_hoy DATE,
    estado VARCHAR(50),
    sala VARCHAR(50),
    fecha_ultima_participacion DATE,
    genero varchar(1)
);

-- Se espera a futuro muchos más registros se inserten, por lo que la performance será importante definir un índice de consulta
CREATE INDEX idx_alumnos_asignados_consulta on alumnos_asignados(genero,fecha_ultima_participacion)
-- Se requieren traer la cantidad de alumnos varones matriculados que están disponibles para participar de una asignación (se considera disponible si la última fecha de participación es menor a 30 días) 
SELECT COUNT(*) from alumnos_asignados aa 
where aa.genero ='H' AND 
aa.fecha_ultima_participacion < (NOW()-30)
-- Se requieren traer la cantidad de alumnas mujeres matriculados que están disponibles para participar de una asignación (se considera disponible si la última fecha de participación es menor a 30 días) 
SELECT COUNT(*) from alumnos_asignados aa 
where aa.genero ='F' AND 
aa.fecha_ultima_participacion < (NOW()-30)
-- Se requiere traer el listado total de alumnos varones y mujeres solo con su nombre.
SELECT nombre from alumnos_asignados aa 
-- Prueba de indice
EXPLAIN SELECT COUNT(*) from alumnos_asignados aa 
where aa.genero ='F' AND 
aa.fecha_ultima_participacion < (NOW()-30)

 
SELECT nombre from alumnos_asignados aa WHERE aa.nombre LIKE "m%" LIMIT 3
