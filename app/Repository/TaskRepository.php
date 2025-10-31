<?php
namespace App\Repository;

use App\Core\Database;
use App\Interface\ITaskRepository;

class TaskRepository implements ITaskRepository
{
    private \mysqli $conn; // MySQLi connection instance

    public function __construct(Database $db)
    {
        $this->conn = $db->getConnection(); // Get database connection
    }

    // Get all tasks of a specific user, ordered by newest first
    public function getTasksByUser(int $userId): array
    {
        $stmt = $this->conn->prepare("SELECT * FROM tasks WHERE user_id = ? ORDER BY id DESC");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $res = $stmt->get_result();
        return $res->fetch_all(MYSQLI_ASSOC); // Return tasks as associative array
    }

    // Add a new task for a user
    public function addTask(int $userId, string $title, string $priority, ?string $due): bool
    {
        if (empty($due)) // If due date is empty, insert NULL
        {
            $stmt = $this->conn->prepare("INSERT INTO tasks (user_id, title, priority, due) VALUES (?, ?, ?, NULL)");
            $stmt->bind_param("iss", $userId, $title, $priority);
        } 
        else 
        {
            $stmt = $this->conn->prepare("INSERT INTO tasks (user_id, title, priority, due) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("isss", $userId, $title, $priority, $due);
        }

        $success = $stmt->execute(); // Execute insert
        if ($success) $this->logActivity($stmt->insert_id, $userId, 'created'); // Log creation
        return $success; // Return success status
    }

    // Delete a task by ID
    public function deleteTask(int $taskId): bool
    {
        $stmt = $this->conn->prepare("DELETE FROM tasks WHERE id = ?");
        $stmt->bind_param("i", $taskId);
        return $stmt->execute(); // Execute delete
    }

    // Toggle task status (done/undone)
    public function toggleTaskStatus(int $taskId, bool $done): bool
    {
        $status = $done ? 1 : 0; // Convert boolean to int
        $stmt = $this->conn->prepare("UPDATE tasks SET status = ? WHERE id = ?");
        $stmt->bind_param("ii", $status, $taskId);
        return $stmt->execute(); // Execute update
    }

    // Log activity for audit purposes
    public function logActivity(int $taskId, int $userId, string $action): void
    {
        $stmt = $this->conn->prepare("INSERT INTO activity_logger (task_id, user_id, action) VALUES (?, ?, ?)");
        $stmt->bind_param("iis", $taskId, $userId, $action);
        $stmt->execute(); // Execute log insert
    }
}
?>
