<?php
namespace App\Interface;

//Interface for User Repository
//Defines data access methods for users
interface IUserRepository
{
    // Get a user by their email, return user data as array or null if not found
    public function getUserByEmail(string $email): ?array;

    // Check if a user exists by email
    public function userExists(string $email): bool;

    // Create a new user with username, email, and password, return success status
    public function createUser(string $username, string $email, string $password): bool;
}
?>
