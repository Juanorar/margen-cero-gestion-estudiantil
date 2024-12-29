<?php

require_once  __DIR__ . '/../router.php';
require_once  __DIR__ . '/../dao/mysql-student-course-dao.php';
require_once  __DIR__ . '/../services/student-course-service.php';
require_once  __DIR__ . '/../config/mysqli-db.php';

appendRoute('GET', '/student-courses', function () {
    $dbConnector = new MySQLIDB();
    $studentCourseDAO = new MySQLStudentCourseDAO($dbConnector);
    $studentCourseService = new StudentCourseService($studentCourseDAO);

    $studentCourseService->getAllStudentCoursesResponse();
});

appendRoute('PUT', '/student-courses', function () {
    $rawPayload = file_get_contents("php://input");

    if (empty($rawPayload)) {
        http_response_code(400);
        echo json_encode(["error" => "El payload está vacío."]);
        return;
    }

    $payload = json_decode($rawPayload);
    
    if (json_last_error() !== JSON_ERROR_NONE) {
        die("Error al decodificar el JSON: " . json_last_error_msg());
    }

    $dbConnector = new MySQLIDB();
    $studentCourseDAO = new MySQLStudentCourseDAO($dbConnector);
    $studentCourseService = new StudentCourseService($studentCourseDAO);

    $studentCourseService->bulkUpdateStudentCourses($payload);
});
