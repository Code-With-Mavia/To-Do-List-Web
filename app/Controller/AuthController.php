<?php
namespace App\Controller;

// Import required classes
use App\Core\Database;
use App\Repository\UserRepository;
use App\Service\AuthService;

class AuthController
{
    private AuthService $authService; // Holds instance of AuthService

    public function __construct()
    {
        // Start session if not started
        if (session_status() === PHP_SESSION_NONE) 
        {
            session_start();
        }

        // Initialize database and repository dependencies
        $db = new Database(); // Create database connection
        $userRepo = new UserRepository($db); // Create user repository
        $this->authService = new AuthService($userRepo); // Inject repository into service
    }

    // Handle incoming HTTP requests
    public function handleRequest(): void
    {
        $action = $_GET['action'] ?? 'loginView'; // Determine action from URL, default to login view

        switch ($action) 
        {
            case 'loginUser': // If user submits login form
                $this->login();
                break;

            case 'signupUser': // If user submits signup form
                $this->signup();
                break;

            case 'logout': // If user clicks logout
                $this->logout();
                break;

            case 'signupView': // Show signup form
                $this->renderView('signup_view.html');
                break;

            case 'loginView': // Show login form
            default:
                $this->renderView('login_view.html');
                break;
        }
    }

    // Handle login request
    private function login(): void
    {
        $email = $_POST['email'] ?? ''; // Get email from POST data
        $password = $_POST['password'] ?? ''; // Get password from POST data

        $result = $this->authService->login($email, $password); // Call service to login
        $this->jsonResponse($result); // Return JSON response
    }

    // Handle signup request
    private function signup(): void
    {
        $username = $_POST['username'] ?? ''; // Get username from POST
        $email = $_POST['email'] ?? ''; // Get email from POST
        $password = $_POST['password'] ?? ''; // Get password from POST

        $result = $this->authService->signup($username, $email, $password); // Call service to signup
        $this->jsonResponse($result); // Return JSON response
    }

    // Logout user
    public function logout(): void
    {
        $this->authService->logout(); // Clear session
        header("Location: index.php"); // Redirect to login page
        exit;
    }

    // Render HTML view
    private function renderView(string $viewFile): void
    {
        include __DIR__ . '/../../Views/' . $viewFile; // Include view file from Views folder
    }

    // Return JSON response
    private function jsonResponse(array $data): void
    {
        header('Content-Type: application/json'); // Set header for JSON
        echo json_encode($data); // Encode data as JSON and output
    }
}
