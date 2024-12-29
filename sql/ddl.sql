CREATE TABLE TiposIdentificacionPersona(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Cursos (
    id BINARY(16) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    fecha_fin_curso DATETIME NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Profesores(
    id BINARY(16) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NOT NULL,
    id_tipo_identificacion INT NOT NULL,
    identificacion VARCHAR(100) UNIQUE NOT NULL,
    telefono_fijo VARCHAR(50) UNIQUE,
    celular VARCHAR(50) UNIQUE,
    email VARCHAR(80) UNIQUE,
    direccion VARCHAR(100),
    PRIMARY KEY(id),
    FOREIGN KEY(id_tipo_identificacion) REFERENCES TiposIdentificacionPersona(id)
);

CREATE TABLE Estudiantes(
    id BINARY(16) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NOT NULL,
    id_tipo_identificacion INT NOT NULL,
    identificacion VARCHAR(100) UNIQUE NOT NULL,
    telefono_fijo VARCHAR(50) UNIQUE,
    celular VARCHAR(50) UNIQUE,
    email VARCHAR(80) UNIQUE,
    direccion VARCHAR(100),
    PRIMARY KEY(id),
    FOREIGN KEY(id_tipo_identificacion) REFERENCES TiposIdentificacionPersona(id)
);

CREATE TABLE HorariosCurso(
    id BINARY(16) NOT NULL,
    dia ENUM("Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"),
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    id_profesor BINARY(16) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_profesor) REFERENCES Profesores(id)
);

CREATE TABLE MaterialesCurso (
    id BINARY(16) NOT NULL,
    id_horario_curso BINARY(16) NOT NULL,
    nombre_archivo VARCHAR(80) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    ruta_archivo VARCHAR(200) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_horario_curso) REFERENCES HorariosCurso(id)
);

CREATE TABLE EstudiantesCursos(
    id BINARY(16) NOT NULL,
    id_horario_curso BINARY(16) NOT NULL, 
    id_estudiante BINARY(16) NOT NULL,
    nota_final DOUBLE NOT NULL,
    aprobado BOOLEAN NOT NULL,
    observaciones VARCHAR(250),
    PRIMARY KEY(id),
    FOREIGN KEY(id_horario_curso) REFERENCES HorariosCurso(id),
    FOREIGN KEY(id_estudiante) REFERENCES Estudiantes(id)
);