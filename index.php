<?php

// Autoload classes via Composer
require __DIR__ . '/vendor/autoload.php';

// Get action from URL, default to 'loginView'
$action = $_GET['action'] ?? 'loginView';

// Decide controller based on action
$controller = in_array($action,['loginUser', 'signupUser', 'signupView', 'loginView', 'logout'])
    ? new \App\Controller\AuthController()
    : new \App\Controller\ToDoController();


// Handle the request
$controller->handleRequest();
?>