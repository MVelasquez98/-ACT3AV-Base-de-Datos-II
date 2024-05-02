create database clientsBD;
use clientsBD;

-- Crear tabla
create table clients(
	id int primary key auto_increment,
	name varchar(100),
	surname varchar(100),
	address varchar(100),
	city varchar(100),
	state varchar(100),
	postal_code int,
	email varchar(190),
	phone varchar(100)
);


-- Crear índice en el campo de correo electrónico
CREATE INDEX idx_clients_email ON clients (email);
-- Crear índice para los consultas siguientes
CREATE INDEX idx_clients_state ON clients (state);
CREATE INDEX idx_clients_pc_cy ON clients (postal_code, city);

-- Escribe una consulta SQL para recuperar todos los datos de los clientes cuyo estado sea "California".
SELECT * FROM clients WHERE state = 'California';
-- Compruebo que la consulta este utilizando el indice correcto (idx_clients_state)
EXPLAIN SELECT * FROM clients WHERE state = 'California';


-- Escribe una consulta SQL para recuperar el nombre y el correo electrónico de los clientes cuyo código postal esté entre 90000 y 95000, y que vivan en la ciudad de "Los Angeles".
SELECT c.name, c.email  FROM clients c WHERE c.postal_code BETWEEN 90000 AND 95000 AND c.city = 'Los Angeles';
-- Compruebo que la consulta este utilizando el indice correcto (idx_clients_pc_cy)
EXPLAIN SELECT c.name, c.email  FROM clients c WHERE c.postal_code BETWEEN 90000 AND 95000 AND c.city = 'Los Angeles';

-- Insertar un registro de administrador manualmente
INSERT INTO clients (name, surname, address, city, state, postal_code, email, phone) VALUES ('Juan', 'Pérez', 'Av. Siempre Viva 1234', 'Springfield', 'Kentucky', 12345, 'juan.perez@example.com', '123456789');
