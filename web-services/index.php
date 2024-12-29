<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");

// Manejar solicitudes OPTIONS (preflight)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200); // Responder con 200 OK
    exit();
}

$routes = [];

require_once 'controllers/course-controller.php';
require_once 'controllers/student-course-controller.php';

handleRequest($routes);