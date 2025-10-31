<?php
namespace App\Interface;

//Interface for Authentication Service
//Defines methods that AuthService must implement
interface IAuthService
{
    // Log in a user with email and password, return result as array
    public function login(string $email, string $password): array;

    // Register a new user with username, email, and password, return result as array
    public function signup(string $username, string $email, string $password): array;

    // Log out the current user, clear session
    public function logout(): void;
}
?>
