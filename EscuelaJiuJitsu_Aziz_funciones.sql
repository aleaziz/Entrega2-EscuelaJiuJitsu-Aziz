
-- CREACIÓN DE VISTAS

CREATE VIEW vista_alumnos_cinturon AS
SELECT 
    a.id_alumno,
    a.nombre,
    a.apellido,
    c.color AS cinturon,
    c.nivel
FROM Alumnos a
JOIN Cinturones c ON a.cinturon_id = c.id_cinturon;

CREATE VIEW vista_asistencias_por_clase AS
SELECT 
    c.id_clase,
    c.fecha,
    c.hora,
    COUNT(a.id_asistencia) AS total_asistentes
FROM Clases c
LEFT JOIN Asistencias a ON c.id_clase = a.id_clase AND a.presente = TRUE
GROUP BY c.id_clase, c.fecha, c.hora;

CREATE VIEW vista_pagos_alumnos AS
SELECT 
    p.id_pago,
    a.nombre,
    a.apellido,
    p.monto,
    p.fecha_pago
FROM Pagos p
JOIN Alumnos a ON p.id_alumno = a.id_alumno;

CREATE VIEW vista_torneos_por_alumno AS
SELECT 
    a.nombre,
    a.apellido,
    t.nombre AS torneo,
    t.fecha
FROM InscripcionesTorneo i
JOIN Alumnos a ON i.id_alumno = a.id_alumno
JOIN Torneos t ON i.id_torneo = t.id_torneo;

-- FUNCIONES

DELIMITER $$

CREATE FUNCTION cantidad_torneos_alumno(id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM InscripcionesTorneo
    WHERE id_alumno = id;
    RETURN total;
END $$

CREATE FUNCTION total_pagado_alumno(id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(monto) INTO total
    FROM Pagos
    WHERE id_alumno = id;
    RETURN IFNULL(total, 0.00);
END $$

-- PROCEDIMIENTOS

CREATE PROCEDURE registrar_pago (
    IN alumno_id INT,
    IN monto_pago DECIMAL(10,2),
    IN fecha_pago DATE
)
BEGIN
    INSERT INTO Pagos (id_alumno, monto, fecha_pago)
    VALUES (alumno_id, monto_pago, fecha_pago);
END $$

CREATE PROCEDURE inscribir_en_torneo (
    IN alumno_id INT,
    IN torneo_id INT
)
BEGIN
    INSERT INTO InscripcionesTorneo (id_alumno, id_torneo)
    VALUES (alumno_id, torneo_id);
END $$

-- TRIGGER Y TABLA LOG

CREATE TABLE LogAsistencias (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_clase INT,
    fecha_registro DATETIME
);

CREATE TRIGGER log_asistencia
AFTER INSERT ON Asistencias
FOR EACH ROW
BEGIN
    INSERT INTO LogAsistencias (id_alumno, id_clase, fecha_registro)
    VALUES (NEW.id_alumno, NEW.id_clase, NOW());
END $$

DELIMITER ;
