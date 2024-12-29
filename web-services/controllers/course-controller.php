<?php 

require_once  __DIR__ . '/../router.php';
require_once  __DIR__ . '/../dao/mysql-course-dao.php';
require_once  __DIR__ . '/../services/course-service.php';
require_once  __DIR__ . '/../config/mysqli-db.php';


appendRoute('GET', '/courses', function(){
    $dbConnector = new MySQLIDB();
    $courseDAO = new MySQLCourseDAO($dbConnector);
    $courseService = new CourseService($courseDAO);

    $courseService->getAllCoursesResponse();
});