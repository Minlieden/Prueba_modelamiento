--crear base de datos
CREATE DATABASE facturacion;
--crear tablas
CREATE TABLE clientes (id SERIAL, rut VARCHAR(12) UNIQUE NOT NULL, nombre VARCHAR(50), direccion VARCHAR(130) NOT NULL, PRIMARY KEY(id));
CREATE TABLE categorias (id SERIAL, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(130), PRIMARY KEY(id)); 
CREATE TABLE productos (id SERIAL, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(130), valor_unitario INT NOT NULL, categorias_id INT, FOREIGN KEY(categorias_id) REFERENCES categorias(id), PRIMARY KEY(id));
CREATE TABLE facturas (numero_factura SERIAL, fecha_factura DATE, subtotal INT, iva INT, precio_total INT, clientes_id INT, FOREIGN KEY(clientes_id) REFERENCES clientes(id), PRIMARY KEY(numero_factura));
CREATE TABLE facturas_productos (id SERIAL, cantidad INT NOT NULL, valor_total_producto INT, productos_id INT, FOREIGN KEY(productos_id) REFERENCES productos(id),facturas_numero_factura INT, FOREIGN KEY(facturas_numero_factura) REFERENCES facturas(numero_factura), PRIMARY KEY(id));

-- insertar datos en clientes
INSERT INTO clientes (rut, nombre, direccion) VALUES ('11.135.235-9', 'Aquiles Baeza', 'los tulipanes 9789, Paine, Santiago');
INSERT INTO clientes (rut, nombre, direccion) VALUES ('12.859.648-k', 'Susana Oria', 'las verduras 7981, La Florida, Santiago');
INSERT INTO clientes (rut, nombre, direccion) VALUES ('13.708.132-0', 'Esteban Quito', 'los muebles 8764, Renca, Santiago');
INSERT INTO clientes (rut, nombre, direccion) VALUES ('14.089.792-1', 'Armando Casas', 'los maestros 13469, Las Condes, Santiago');
INSERT INTO clientes (rut, nombre, direccion) VALUES ('15.932.830-2', 'Aurelio del transito', 'pasadena 1646, Vitacura, Santiago');

-- insertar datos en categorias
INSERT INTO categorias (nombre, descripcion) VALUES ('Verduras', 'productos considerados verduras');
INSERT INTO categorias (nombre, descripcion) VALUES ('Frutas', 'productos considerados frutas');
INSERT INTO categorias (nombre, descripcion) VALUES ('Lacteos', 'productos derivados de la leche');


-- insertar datos en productos
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('lechuga', 'lechugas del sur del pais', 1, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('acelga', 'acelgas del sur del pais', 2, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('repollo', 'repollo del sur del pais', 4, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('espinaca', 'espinaca del sur del pais', 2, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('zanahorias', 'zanahorias del sur del pais', 1, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('papas', 'papas del sur del pais', 5, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('rabanos', 'rabanos del sur del pais', 6, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('betarraga', 'betarragas del sur del pais', 8, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('brocoli', 'brocoli del sur del pais', 10, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('coliflor', 'coliflor del sur del pais', 12, 1);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('manzana', 'manzanas del sur del pais', 3, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('platano', 'platanos del norte del pais', 6, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('durazno', 'durazno del sur del pais', 2, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('damasco', 'damasco del sur del pais', 2, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('granada', 'granada del sur del pais', 9, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('aji', 'aji del centro del pais', 1, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('pimenton', 'pimenton del sur del pais', 2, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('membrillo', 'membrillo del sur del pais', 3, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('frutillas', 'frutillas del sur del pais', 15, 2);
INSERT INTO productos ( nombre, descripcion, valor_unitario, categorias_id) VALUES ('cerezas', 'cerezas del sur del pais', 13, 2);

-- insertar datos en facturas
INSERT INTO facturas (clientes_id, fecha_factura, subtotal, iva, precio_total) VALUES (1, '2021-01-02', 140, 27,167 ),(1,'2021-01-10', 165, 31, 196);
INSERT INTO facturas (clientes_id, fecha_factura, subtotal, iva, precio_total) VALUES (2, '2021-01-15', 180, 34, 214),(2, '2021-01-18', 60, 11, 71),(2, '2021-01-20', 177, 34, 211);
INSERT INTO facturas (clientes_id, fecha_factura, subtotal, iva, precio_total) VALUES (3, '2021-01-21', 180, 34, 214);
INSERT INTO facturas (clientes_id, fecha_factura, subtotal, iva, precio_total) VALUES (4, '2021-01-23', 110, 21, 131),(4, '2021-01-26', 253, 48, 301),(4, '2021-01-30', 165, 31, 196),(4, '2021-02-01', 240, 46, 286);

-- insertar datos en la tabla de union entre facturas y productos
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (1,1,40,40),(1,2,50,100);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (2,3,20,80),(2,4,10,20),(2,20,5,65);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (3,5,60,60),(3,6,12,60),(3,16,16,16);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (4,5,40,40),(4,17,10,20);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (5,5,30,30),(5,8,9,72),(5,19,5,75);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (6,11,60,180);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (7,9,5,50),(7,12,10,60);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (8,15,7,63),(8,18,20,60),(8,20,10,130);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (9,4,20,40),(9,13,30,60),(9,6,4,20),(9,15,5,45);
INSERT INTO facturas_productos ( facturas_numero_factura, productos_id, cantidad, valor_total_producto) VALUES (10,7,40,240);


--consultas finales de la prueba
--¿Que cliente realizó la compra más cara?
SELECT clientes_id, nombre FROM facturas LEFT JOIN clientes ON facturas.clientes_id = clientes.id ORDER BY precio_total DESC LIMIT 1;
--¿Que cliente pagó sobre 100 de monto?
SELECT clientes_id FROM facturas WHERE precio_total > 100 GROUP BY clientes_id ORDER BY clientes_id ASC;
--¿Cuantos clientes han comprado el producto 6.
SELECT COUNT(clientes_id) FROM facturas INNER JOIN facturas_productos ON facturas_numero_factura = numero_factura WHERE productos_id = 6;