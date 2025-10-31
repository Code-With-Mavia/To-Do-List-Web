<?php
namespace App\Service;

use App\Interface\IAuthService;
use App\Repository\UserRepository;

class AuthService implements IAuthService
{
    private UserRepository $userRepo; // Holds UserRepository instance

    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo; // Inject UserRepository

        // Start session if not already started
        if (session_status() === PHP_SESSION_NONE) 
        {
            session_start();
        }
    }

    // Handle login functionality
    public function login(string $email, string $password): array
    {
        $user = $this->userRepo->getByEmail($email); // Fetch user by email

        // Check if user exists
        if (!$user) 
        {
            return ['status' => 'error', 'message' => 'User not found'];
        }

        // Verify password
        if (!password_verify($password, $user['password'])) 
        {
            return ['status' => 'error', 'message' => 'Invalid credentials'];
        }

        // Set session variables
        $_SESSION['id'] = $user['id'];
        $_SESSION['username'] = $user['username'];

        // Return success response
        return ['status' => 'success', 'id' => $user['id'], 'username' => $user['username']];
    }

    // Handle signup functionality
    public function signup(string $username, string $email, string $password): array
    {
        // Check if email already exists
        if ($this->userRepo->exists($email)) 
        {
            return ['status' => 'error', 'message' => 'Email already exists'];
        }

        // Hash password and create user
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
        $this->userRepo->create($username, $email, $hashedPassword);

        // Set session for newly registered user
        $_SESSION['id'] = $this->userRepo->getByEmail($email)['id'];
        $_SESSION['username'] = $username;

        return ['status' => 'success', 'message' => 'User registered successfully'];
    }

    // Handle logout functionality
    public function logout(): void
    {
        $_SESSION = []; // Clear session data

        // Remove session cookie if exists
        if (ini_get("session.use_cookies")) 
        {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }

        session_destroy(); // Destroy session
    }
}
