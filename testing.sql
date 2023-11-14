-----TESTING Y PRUEBAS-----

USE CureSA
go
--Realizamos los select para comprobar las tablas con datos cargados
--Ejecución de los SP
EXEC Normalizacion.cargarTablaPrestador;
GO
EXEC Normalizacion.cargarTablaSedes
GO
EXEC Normalizacion.cargarMedicos_Especialidad
GO
EXEC Normalizacion.cargarPacientes_Domicilio
GO


--Realizamos los select para comprobar las tablas con datos cargados

select * from Sistema.Paciente
select * from Sistema.Usuario
select * from Sistema.Medico
select * from Sistema.Prestador
select * from Sistema.Domicilio
select * from Sistema.Especialidad
select * from Sistema.Tipo_Turno
select * from Sistema.Sede_Atencion
select * from Sistema.Autorizacion_Estudio
select * from Sistema.Estado_Turno
GO


	--Ejemplo de insercion
	EXEC ManejoDeDatos.InsertarPacienteConDomicilio
    @nombre = 'Juan',
    @apellido = 'Pérez',
    @apellido_materno = 'Gómez',
    @fecha_de_nacimiento = '1988-03-15',
    @tipo_documento = 'DNI',
    @nro_documento = '98765431',
    @sexo_biologico = 'Masculino',
    @genero = 'Hombre',
    @nacionalidad = 'Argentino',
    @foto_perfil = 'juan.jpg',
    @telefono_fijo = '011-2222-3333',
    @telefono_alternativo = '011-4444-5555',
    @telefono_laboral = '011-6666-7777',
    @mail = 'juan.perez@example.com',
    @calle_y_numero = 'Calle Principal 100',
    @piso = '1',
    @departamento = 'A',
    @codigo_postal = '12345',
    @pais = 'Argentina',
    @provincia = 'Buenos Aires',
    @localidad = 'La Plata'
GO

--Realizamos los select correspondientes.
select * from Sistema.Paciente
select * from Sistema.Domicilio
select * from Sistema.Usuario
GO	



--Ejemplo para modificar los datos del Paciente antes insertados

EXEC ManejoDeDatos.ModificarDatosPaciente
@id_historia_clinica = 1,   --Aca indico el numero de la historia clinica del paciente a modificar
@telefono_fijo = '011-8888-8888', -- Nuevo número de teléfono fijo
@mail = 'juan.perez.nuevo@yahoo.com', -- Nuevo correo electrónico
@calle_y_numero = 'Nueva Calle 200', -- Nuevo domicilio
@piso = '2',
@departamento = 'B',
@codigo_postal = '54321',
@pais = 'Argentina',
@provincia = 'Buenos Aires',
@localidad = 'La Plata'
GO

select * from Sistema.Paciente 
select * from Sistema.Domicilio
GO

--Ejemplo de ejecucion 

EXEC ManejoDeDatos.EliminarPaciente
@id_historia_clinica = 1  --Aca indico el numero de la historia clinica del paciente a modificar
GO
select * from Sistema.Usuario
select * from Sistema.Paciente 
select * from Sistema.Domicilio
GO



--- Ejemplo de ejecucion para el cambio de contrase�a del usuario
	
	
EXEC ManejoDeDatos.CambiarContraseniaUsuario
@id_usuario = 1, -- ID del usuario que quiere modificar la contrase�a
@nueva_contrasenia = 'contraseña' -- Nueva contrase�a
GO

select * from Sistema.Usuario
GO



-- Ejemplo para insertar un nuevo prestador
EXEC ManejoDeDatos.InsertarPrestador
@nombre_prestador = 'Nombre Prestador',
@plan_prestador = 'Plan'
GO


select * from Sistema.Prestador
GO


--Ejemplo para eliminar prestador
EXEC ManejoDeDatos.EliminarPrestador
@id_prestador = 21
GO


--Ejemplo para añadir especialidad

EXEC ManejoDeDatos.AgregarEspecialidad
    @nombre_especialidad = 'CARDIOLOGÍA'  -- nombre de la especialidad
GO

select * from Sistema.Especialidad
GO

--Ejemplo para validación en caso de repetición
EXEC ManejoDeDatos.AgregarEspecialidad
    @nombre_especialidad = 'CARDIOLOGÍA'  -- nombre de la especialidad
GO


--Ejemplo para eliminar especialidad

EXEC ManejoDeDatos.EliminarEspecialidad
    @id_especialidad = 18
GO

select * from Sistema.Especialidad
GO



-- Ejemplo de ejecucion para insertar un nuevo m�dico
EXEC ManejoDeDatos.InsertarMedico
@nombre = 'Juan',
@apellido = 'Pérez',
@numero_matricula = 12345,
@id_especialidad = 1  -- ID de la especialidad
GO

SELECT * FROM Sistema.Medico
GO


-- Ejemplo de ejecucion para modificar un nuevo m�dico
EXEC ManejoDeDatos.ModificarMedico
@id = 2,
@nombre = 'Juan',
@apellido = 'Pérez',
@numero_matricula = 123456,
@id_especialidad = 1  -- ID de la especialidad
GO

SELECT * FROM Sistema.Medico
GO



-- Ejemplo de eliminar un m�dico por su ID
	
EXEC ManejoDeDatos.EliminarMedico
 @id_medico = 2  -- ID del m�dico a eliminar
GO

SELECT * FROM Sistema.Medico
GO


--Ejecución de prueba de xml
exec Sistema.generarArchivoXml @fecha_inicio = '2023-10-01', @fecha_fin = '2023-10-08';
GO



--Ejecución de prueba de inserción de datos desde json
exec Sistema.InsertarDatosDesdeJSON
GO