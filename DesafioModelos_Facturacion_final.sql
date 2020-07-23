CREATE TABLE cliente(
id_cliente INT NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
rut VARCHAR(10) NOT NULL UNIQUE,
direccion VARCHAR(50) --dirección incluye todos los campos que identifican el domicilio del cliente
);

SELECT * FROM cliente;

CREATE TABLE categoria(
id_categoria INT NOT NULL PRIMARY KEY,
nombre_categoria VARCHAR(20) NOT NULL UNIQUE,
descripcion VARCHAR(50)
);

CREATE TABLE factura(
id_factura INT NOT NULL PRIMARY KEY,
nro_factura INT NOT NULL,
fecha_factura DATE NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);

ALTER TABLE factura
DROP COLUMN cant_productos;

SELECT * FROM factura;

CREATE TABLE producto(
id_producto INT NOT NULL PRIMARY KEY,
nombre_producto VARCHAR(30) NOT NULL,
descripcion VARCHAR(50),
precio_unitario INT NOT NULL,
id_categoria INT NOT NULL,
FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE factura_producto(
id_factura INT NOT NULL,
id_producto INT NOT NULL,
FOREIGN KEY(id_factura) REFERENCES factura(id_factura),
FOREIGN KEY(id_producto) REFERENCES producto(id_producto),
CONSTRAINT PK_fact_prod PRIMARY KEY(id_factura, id_producto) 
);

ALTER TABLE factura_producto
ADD cantidad_items INT NOT NULL;

--------------- //Agregando 5 clientes // ---------------

INSERT INTO cliente(id_cliente, nombre, rut, direccion)
VALUES(1, 'juan carlos bodoque', '20002200-5', 'casita del barrio alto, santiago');

INSERT INTO cliente(id_cliente, nombre, rut, direccion)
VALUES(2, 'komugi san', '18002200-5', 'otra casita, maipu');

INSERT INTO cliente(id_cliente, nombre, rut, direccion)
VALUES(3, 'keichi kun', '66002200-k', 'muy lejos #22, valparaiso');

INSERT INTO cliente(id_cliente, nombre, rut, direccion)
VALUES(4, 'elena caffarena', '10002200-0', 'santiago n° 1949, copiapo');

INSERT INTO cliente(id_cliente, nombre, rut, direccion)
VALUES(5, 'hanna arendt', '56002200-5', 'camino #1975, rancagua');

--------------- //Agregando 3 categorías // ---------------

INSERT INTO categoria(id_categoria, nombre_categoria, descripcion)
VALUES (1, 'muebles', 'muebles de distintos materiales para el hogar');

INSERT INTO categoria(id_categoria, nombre_categoria, descripcion)
VALUES (2, 'pinturas', 'pinturas para decoración y construcción');

INSERT INTO categoria(id_categoria, nombre_categoria, descripcion)
VALUES (3, 'electrónica', 'artículos tecnológicos');

SELECT * FROM categoria;

--------------- //Agregando 8 productos // ---------------
SELECT * FROM producto;

DELETE FROM producto;

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (1, 'sillon', 'beige ecocuero 3 cuerpos', 90000, 1);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (2, 'repisa', 'esquinera blanca con vidrio', 32000, 1);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (3, 'parlante', 'bluetooth wifi', 15300, 3);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (4, 'drone', 'blanco gyroscopio 6 ejes', 66900, 3);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (5, 'go-pro', 'hero 7 deportiva', 75000, 3);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (6, 'esmalte al agua', 'exterior rojo 5L', 25000, 2);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (7, 'pintura spray', 'brillante 340gr verde', 9150, 2);

INSERT INTO producto(id_producto, nombre_producto, descripcion, precio_unitario, id_categoria)
VALUES (8, 'pintura spray', 'opaca 340gr rojo', 9300, 2);

--------------- // Factura N°1 para cli 1, con 2 productos // ---------------
SELECT * FROM factura;
SELECT * FROM factura_producto;

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (1, 53620, '20-02-2020', 1);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (1, 2, 1);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (1, 3, 1);

--------------- // Factura N°2 para cli 1, con 3 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (2, 53800, '21-02-2020', 1);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (2, 8, 1);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (2, 7, 1);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (2, 3, 1);
SELECT * FROM CLIENTE;
SELECT * FROM FACTURA_PRODUCTO;
SELECT * FROM FACTURA;

--------------- // Factura N°3 para cli 2, con 3 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (3, 53830, '19-02-2020', 2);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (3, 8, 1);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (3, 6, 1);

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (3, 5, 1);

--------------- // Factura N°4 para cli 2, con 2 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (4, 53831, '19-02-2020', 2);

SELECT * FROM producto;
SELECT * FROM factura;
SELECT * FROM factura_producto;

INSERT INTO factura_producto(id_factura, id_producto, cantidad_items)
VALUES (4, 3, 2);

--------------- // Factura N°5 para cli 2, con 3 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (5, 53900, '21-02-2020', 2);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (5, 7, 3);


--------------- // Factura N°6 para cli 3, con 1 producto // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (6, 53903, '21-02-2020', 3);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (6, 6, 1);

--------------- // Factura N°7 para cli 4, con 2 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (7, 51003, '10-02-2020', 4);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (7, 8, 1);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (7, 5, 1);

--------------- // Factura N°8 para cli 4, con 3 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (8, 51005, '11-02-2020', 4);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (8, 6, 2);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (8, 3, 1);

--------------- // Factura N°9 para cli 4, con 4 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (9, 51006, '12-02-2020', 4);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (9, 2, 2);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (9, 8, 2);

--------------- // Factura N°10 para cli 4, con 1 productos // ---------------

INSERT INTO factura(id_factura, nro_factura, fecha_factura, id_cliente)
VALUES (10, 51008, '13-02-2020', 4);

INSERT INTO factura_producto(id_factura, id_producto,cantidad_items)
VALUES (10, 8, 1);

SELECT * FROM producto;
SELECT * FROM factura;
SELECT * FROM factura_producto;


--------------- // Cliente que realizó la compra más cara // ---------------

SELECT f.id_factura, SUM(fp.cantidad_items)
FROM factura_producto fp
JOIN factura f ON fp.id_factura=f.id_factura
GROUP BY f.id_factura;

SELECT * FROM factura_producto;
SELECT * FROM factura;
SELECT * FROM producto;

SELECT c.nombre as Cliente, f.nro_factura, fp.cantidad_items, p.precio_unitario, 
fp.cantidad_items* p.precio_unitario as subtotal
FROM cliente c
JOIN factura f ON c.id_cliente=f.id_cliente
JOIN factura_producto fp ON f.id_factura=fp.id_factura
JOIN producto p ON fp.id_producto=p.id_producto
ORDER BY cliente, f.nro_factura;

SELECT c.nombre, SUM( p.precio_unitario*fp.cantidad_items) as total 
FROM cliente c
JOIN factura f ON c.id_cliente=f.id_cliente
JOIN factura_producto fp ON f.id_factura=fp.id_factura
JOIN producto p ON fp.id_producto=p.id_producto
GROUP BY f.nro_factura, c.nombre
ORDER BY total DESC;

COMMIT;

----- ESTA CONSULTA FUNCIONA EN ORACLE 18 SQL DEVELOPER:

SELECT c.nombre, SUM( p.precio_unitario*fp.cantidad_items) as total 
FROM cliente c
JOIN factura f ON c.id_cliente=f.id_cliente
JOIN factura_producto fp ON f.id_factura=fp.id_factura
JOIN producto p ON fp.id_producto=p.id_producto
GROUP BY f.nro_factura, c.nombre
ORDER BY total DESC
FETCH FIRST 1 ROWS ONLY;
--------------- // Cliente que pagó sobre 100 (se reemplaza por 35000) // ---------------

SELECT c.nombre, SUM( p.precio_unitario*fp.cantidad_items) as total 
FROM cliente c
JOIN factura f ON c.id_cliente=f.id_cliente
JOIN factura_producto fp ON f.id_factura=fp.id_factura
JOIN producto p ON fp.id_producto=p.id_producto
GROUP BY c.nombre, f.id_factura
HAVING SUM( p.precio_unitario*fp.cantidad_items)>=35000
ORDER BY total DESC;

--------------- // Clientes que compraron el producto 6 // ---------------

SELECT c.nombre, fp.id_producto 
FROM cliente c
JOIN factura f ON c.id_cliente=f.id_cliente
JOIN factura_producto fp ON f.id_factura=fp.id_factura
JOIN producto p ON fp.id_producto=p.id_producto
WHERE fp.id_producto=6;
