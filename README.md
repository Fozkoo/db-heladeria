Querys

 Empleados
	
1) Crear un empleado
	INSERT INTO empleados(nombre, apellido, dni, cuil, direccion, telefono, fecha_alta, fecha_baja, jefe)
	VALUES('Tiziano','Martinelli',45806935,23454454543,'Alsina',232643432,'09-04-2025', '06-04-2025', 1);

2) Buscar un empleado por id
	
	SELECT * FROM empleados WHERE idempleado=1;
	

3) Borrar un empleado por id

	DELETE FROM empleados WHERE idempleado=1;
	

	Administrativo (hijo de empleado)

1)  Crear un administrativo
	INSERT INTO administrativos (idadmin, titulo, turno)
	VALUES(1, 'Abogada', 'tarde'); --> (El id admin es el id del empleado)
	
2)	Filtrar por id
	
	SELECT * FROM administrativos WHERE idadmin=1; --> id del empleado
	
3)	Borrar un administrativo
	
	DELETE FROM administrativos WHERE idadmin={idAdmin}; --> id del usuario
	

Repartidor (hijo de empleado)

1) Crear repartidor

	INSERT INTO repartidores(idrepartidor, turno) --> el id repartidor es el id del empleado
	VALUES(1,'tarde');
	
2) Filtrar por ID
	
	SELECT * FROM repartidores WHERE idrepartidor={idrepartidor};

3) Eliminar por ID
	
	DELETE FROM repartidores WHERE idrepartidor={idRepartidor}


Gusto

1) Crear gustos

	INSERT INTO gustos (nombre_g, descripcion)
	VALUES ('Dulce de leche', 'Rico');

2) Filtrar por ID
	
	SELECT * FROM gustos WHERE idgusto=1;
	
3) Borrar por ID

   DELETE FROM gustos WHERE idgusto=1;
   



