<?php
namespace App\Core;

class Database
{
    private \mysqli $conn;

    public function __construct()
    {
        $servername = "127.0.0.1";
        $username   = "root";
        $password   = "root"; // MAMP default
        $database   = "ToDoList";
        $port       = 8889;

        $this->conn = new \mysqli($servername, $username, $password, $database, $port);

        if ($this->conn->connect_error) {
            die("Database connection failed: " . $this->conn->connect_error);
        }
    }

    public function getConnection(): \mysqli
    {
        return $this->conn;
    }
}
