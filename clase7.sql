-- crear las tablas
CREATE table IF NOT EXISTS students(
student_id INT primary key,
name varchar(100)
)

CREATE table grades(
grade_id int primary key,
student_id int,
grade char(1)
)

CREATE table scores(
score_id int primary key,
student_id int,
score int
)

-- insertar datos de prueba 
INSERT INTO students (student_id,name) VALUES
(1,'Matias'),
(2,'Soledad'),
(3,'Joaquin'),
(4,'Juan');


INSERT INTO grades(grade_id,student_id,grade) VALUES
(1,1,'A'),
(2,2,'B'),
(3,3,'C'),
(4,1,'B');

INSERT INTO scores(score_id, student_id, score) VALUES
(1,1,85),
(2,2,90),
(3,3,70),
(5,3,65),
(4,1,95);
(6,3,100)

-- consultas
-- traer todos los alumnos con calificacion A y B

select name 
from students 
where student_id IN (
SELECT student_id 
FROM grades 
WHERE grade IN ('A','B')
)

-- saber los estudiantes cuyo puntaje es mayor que cualquier puntaje del estudiante 3

select name 
from students 
where student_id IN (
	SELECT student_id
	FROM scores 
	WHERE score > ALL (
		SELECT score 
		FROM scores 
		WHERE student_id=3
	)
);

-- Queremos seleccionar estudiantes que tienen alguna calificación registrada
SELECT s.name 
FROM students s
WHERE EXISTS (
	SELECT 1 
	FROM grades g
	WHERE s.student_id = g.student_id
)
-- resuelto con un JOIN 
SELECT DISTINCT s.name
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id;

-- queremos listar todos los estudianes con su calificacion, aunque no este cargada
select s.name, COALESCE (g.grade,'No grade') as grade
from students s
LEFT JOIN grades g ON s.student_id = g.student_id;

-- traer los estudiantes que no tiene ninguna nota cargada
select s.name
FROM students s
WHERE NOT EXISTS (SELECT 1 FROM scores sc WHERE s.student_id = sc.student_id)

-- resolvemos con un LEFT JOIN 

select s.name
from students s
LEFT JOIN scores sc ON s.student_id=sc.student_id
WHERE sc.student_id IS NULL 

-- FUNCIONES DE AGREGACION

-- calcular la suma total de los puntajes de todos los estudiantes

SELECT SUM(score) as total_score
from scores

-- calcular el promedio total de los puntajes de todos los estudiantes

SELECT AVG(score) as average_score
from scores

-- calcular la cantidad total de alumnos
SELECT COUNT(*) as total_students
from students


-- calcular el promedio mas bajo de los puntajes de todos los estudiantes

SELECT MIN(score) as lowset_score
from scores

-- calcular el promedio mas alto de los puntajes de todos los estudiantes

SELECT MAX(score) as highset_score
from scores


















