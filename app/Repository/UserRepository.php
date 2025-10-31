<?php
namespace App\Repository;

use App\Core\Database;

class UserRepository
{
    private \mysqli $conn; // MySQLi connection instance

    public function __construct(Database $db)
    {
        $this->conn = $db->getConnection(); // Get database connection
    }

    // Get a user by email, return associative array or null
    public function getByEmail(string $email)
    {
        $stmt = $this->conn->prepare("SELECT * FROM users WHERE email = ? LIMIT 1");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $res = $stmt->get_result();
        return $res->fetch_assoc() ?: null; // Return user or null
    }

    // Check if a user exists by email
    public function exists(string $email)
    {
        $stmt = $this->conn->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0; // Return true if user exists
    }

    // Create a new user
    public function create(string $username, string $email, string $password)
    {
        $stmt = $this->conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $username, $email, $password);
        return $stmt->execute(); // Execute insert and return success
    }
}
?>
