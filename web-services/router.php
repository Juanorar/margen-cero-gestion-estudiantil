<?php

function appendRoute($method, $path, $callback){
    global $routes;
    $routes[] = ['method' => $method, 'path' => $path, 'callback' => $callback];
}

function handleRequest($routes){
    $requestedMethod = $_SERVER['REQUEST_METHOD'];
    $requestedPath = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

    foreach ($routes as $route){
        $routePath = preg_replace('/\{[a-zA-Z0-9_]+\}/', '([a-zA-Z0-9_-]+)', $route['path']);
        $routeRegex = '@^' . $routePath . '$@';

        if ($route['method'] === $requestedMethod && preg_match($routeRegex, $requestedPath, $matches)) {
            array_shift($matches);
            call_user_func_array($route['callback'], $matches);
            return;
        }
    }

    http_response_code(404);
    echo json_encode(['error' => 'Endpoint not found']);
}

