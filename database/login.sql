use control_notas;

SELECT * FROM personal;

SELECT p.personal, p.nombre, p.apellido, p.direccion, p.telefono, p.estado, p.cui,
p.personal_escuela, p.personal_tipo_personal as idTipo, t.tipo_personal as Tipo FROM personal p
INNER JOIN tipo_personal t
ON p.personal_tipo_personal = t.tipo_personal
where p.usuario = ? and p.contrasenia = ?;




