
-- Inserciones para tabla Cinturones
INSERT INTO Cinturones (color, nivel) VALUES
('Blanco', 1),
('Azul', 2),
('Violeta', 3),
('Marrón', 4),
('Negro', 5);

-- Inserciones para tabla Alumnos
INSERT INTO Alumnos (nombre, apellido, fecha_nacimiento, cinturon_id) VALUES
('Lucas', 'Pérez', '2001-05-12', 2),
('Ana', 'Rodríguez', '1999-11-30', 1),
('Martín', 'Gómez', '1997-02-18', 3),
('Lucía', 'Fernández', '2002-07-08', 1),
('Tomás', 'Silva', '1995-09-20', 4);

-- Inserciones para tabla Instructores
INSERT INTO Instructores (nombre, apellido) VALUES
('Mariano', 'López'),
('Florencia', 'Martínez');

-- Inserciones para tabla Clases
INSERT INTO Clases (fecha, hora, id_instructor) VALUES
('2024-06-01', '18:00:00', 1),
('2024-06-03', '19:00:00', 2),
('2024-06-05', '20:00:00', 1);

-- Inserciones para tabla Asistencias
INSERT INTO Asistencias (id_alumno, id_clase, presente) VALUES
(1, 1, TRUE),
(2, 1, TRUE),
(3, 2, TRUE),
(4, 3, FALSE),
(5, 3, TRUE);

-- Inserciones para tabla Torneos
INSERT INTO Torneos (nombre, fecha) VALUES
('Open de Invierno', '2024-07-15'),
('Copa Jiu-Jitsu', '2024-08-22');

-- Inserciones para tabla InscripcionesTorneo
INSERT INTO InscripcionesTorneo (id_torneo, id_alumno) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 5);

-- Inserciones para tabla Pagos
INSERT INTO Pagos (id_alumno, monto, fecha_pago) VALUES
(1, 1500.00, '2024-06-01'),
(2, 1500.00, '2024-06-01'),
(3, 1600.00, '2024-06-02'),
(4, 1500.00, '2024-06-05'),
(5, 1700.00, '2024-06-06');
