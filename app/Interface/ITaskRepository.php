<?php
namespace App\Interface;

//Interface for Task Repository
//Defines data access methods for tasks
interface ITaskRepository
{
    // Get all tasks of a specific user
    public function getTasksByUser(int $userId): array;

    // Add a new task for a specific user
    public function addTask(int $userId, string $title, string $priority, ?string $due): bool;

    // Delete a task by its ID
    public function deleteTask(int $taskId): bool;

    // Toggle the status of a task (done/undone)
    public function toggleTaskStatus(int $taskId, bool $done): bool;

    // Log user activity related to a task (e.g., completed, deleted)
    public function logActivity(int $taskId, int $userId, string $action): void;
}
?>
