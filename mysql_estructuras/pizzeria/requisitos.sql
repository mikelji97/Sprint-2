
INSERT INTO producto (tipo_producto, nombre, descripcion, precio)
     VALUES ('hamburguesa','pollo','sin queso',14),
            ('pizza','barbacoa',NULL,12),
            ('bebida','cocacola','zero',3)
;
INSERT INTO tienda (direccion, codigo_postal, ciudad, provincia)
     VALUES ('Rossello 450', 04111, 'Salou', 'Tarragona'),
            ('Sanesteban 4', 05581, 'Logroño', 'La Rioja'),
            ('Rojas 86', 31378, 'Peralta', 'Navarra')
     
;
INSERT INTO cliente(nombre, apellidos, direccion, codigo_postal, ciudad, provincia, telefono)
     VALUES('Mikel','Jiménez Lecuna', 'rossello 340', 08025, 'Barcelona', 'Barcelona',616397225),
           ('Aitor','Illaramendi', 'vitoria 44', 06025, 'Tafalla', 'Navarra',665447158),
           ('Aritz','Lopez de Vega', 'casetas 38', 05525, 'Calahorra', 'La Rioja',687885555)
;
INSERT INTO pedido (fecha_hora, tipo_pedido, id_cliente, id_tienda)
     VALUES ('2025-09-05 14:30:16','domicilio',2,1 ),
            ('2025-09-04 18:04:16','recogida',3,1),
            ('2025-09-03 10:37:19','domicilio',2,2)
;
INSERT INTO detalle_pedido (cantidad, precio, id_pedido, id_producto)
     VALUES (4 , 6 , 3 , 2),
            (1 , 14 , 1 , 1),
            (2 , 10 , 2 , 2)
;

INSERT INTO empleado (nombre, apellidos, nif, telefono, tipo_empleado, id_tienda)
     VALUES ('Antonio', 'San Juan', '78771425P', 660854124, 'repartidor', 3),
            ('Andrea', 'Martinez', '74142578M', 789874154, 'cocinero', 1),
            ('Adrian', 'Mateo Dominguez', '74582441I', 667784415, 'repartidor', 2)
;
INSERT INTO pedidos_domicilio (fecha_hora, id_empleado, id_pedido)
     VALUES ('2025-05-15 14:20:00', 2, 1 ),
            ('2025-05-15 04:14:00', 3, 2 ),
            ('2025-02-29 10:25:00', 1, 3 )
; 
           
SELECT t.ciudad, SUM(dp.cantidad) FROM detalle_pedido dp
JOIN pedido p ON dp.id_pedido = p.id_pedido
JOIN producto pr ON dp.id_producto = pr.id_producto
JOIN tienda t ON p.id_tienda = t.id_tienda
WHERE pr.tipo_producto = 'Bebida'
AND t.ciudad = 'Peralta'
;


SELECT COUNT(p.id_pedido) FROM pedido p
JOIN pedidos_domicilio pd ON pd.id_pedido = p.id_pedido
JOIN empleado e ON e.id_empleado = pd.id_empleado
WHERE e.id_empleado = 2
;
