<?php

require_once __DIR__ . '/../interfaces/dao/course-dao.php';

class CourseService {
    private $courseDAO;

    public function __construct(CourseDAO $courseDAO)
    {
        $this->courseDAO = $courseDAO;
    }

    public function getAllCoursesResponse(){
        try {
            $courses = $this->courseDAO->getAllCourses();

            http_response_code(200);
            echo json_encode($courses);
        }catch(error){
            http_response_code(500);
        }
    }
}