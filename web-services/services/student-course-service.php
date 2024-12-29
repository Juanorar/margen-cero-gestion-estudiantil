<?php

require_once __DIR__ . '/../interfaces/dao/student-course-dao.php';

class StudentCourseService {
    private $studentCourseDAO;

    public function __construct(StudentCourseDAO $studentCourseDAO)
    {
        $this->studentCourseDAO = $studentCourseDAO;
    }

    public function getAllStudentCoursesResponse(){
        try {
            $courses = $this->studentCourseDAO->getAllStudentCourses();

            http_response_code(200);
            echo json_encode($courses);
        }catch(error){
            http_response_code(500);
        }
    }

    public function bulkUpdateStudentCourses($updates){

        try {
            $this->studentCourseDAO->bulkUpdateStudentCourses($updates);

            http_response_code(200);
            echo json_encode([
                "message" => "Actulizado con éxito"
            ]);
        }catch(Exception $error){
            http_response_code(500);
            echo json_encode([
                "error" => $error->getMessage()
            ]);
        }
    }
}