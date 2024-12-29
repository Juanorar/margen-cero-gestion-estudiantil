<?php

require_once __DIR__ . '/../interfaces/database-connection.php';
require_once __DIR__ . '/../interfaces/dao/course-dao.php';

class MySQLCourseDAO implements CourseDAO{
    private $db;

    public function __construct(DatabaseConnectionInterface $databaseConnection){
        $this->db = $databaseConnection->connect();
    }

    public function getAllCourses(){
    $sql = "SELECT HEX(id) as id, nombre, descripcion, fecha_fin_curso FROM Cursos";

        $result = $this->db->query($sql);

        return $result->fetch_all(MYSQLI_ASSOC);
    }
}