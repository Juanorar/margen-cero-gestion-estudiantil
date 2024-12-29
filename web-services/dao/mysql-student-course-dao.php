<?php

require_once __DIR__ . '/../interfaces/database-connection.php';
require_once __DIR__ . '/../interfaces/dao/student-course-dao.php';

class MySQLStudentCourseDAO implements StudentCourseDAO
{
    private $db;

    public function __construct(DatabaseConnectionInterface $databaseConnection)
    {
        $this->db = $databaseConnection->connect();
    }

    public function getAllStudentCourses()
    {
        $sql = "SELECT HEX(ec.id) AS id, e.primer_nombre, e.primer_apellido, ec.nota_final, ec.aprobado, ec.observaciones  FROM EstudiantesCursos ec LEFT JOIN estudiantes e ON ec.id_estudiante = e.id";

        $result = $this->db->query($sql);

        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function bulkUpdateStudentCourses($updates)
    {
        $this->db->begin_transaction();

        try {
            $stmt = $this->db->prepare("UPDATE EstudiantesCursos SET nota_final = ?, observaciones = ?, aprobado = ? WHERE id  = UNHEX(?)");

            if ($stmt === false) {
                throw new Exception("Error al preparar la actualización en lote" . $this->db->error);
            }

            foreach ($updates as $update) {
                $notaFinal = $update->nota_final;
                $observaciones = $update->observaciones;
                $aprobado = $update->aprobado;
                $id = $update->id;

                $stmt->bind_param("dsis", $notaFinal, $observaciones, $aprobado, $id);
                
                if(!$stmt->execute()){
                    throw new Exception("Error al actualizar por lotes");
                }
            }
            $this->db->commit();
        } catch (Exception $e) {
            $this->db->rollback();
            throw $e;
        } finally {
            $stmt->close();
            $this->db->close();
        }
    }
}
