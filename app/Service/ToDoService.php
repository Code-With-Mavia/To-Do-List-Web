<?php
namespace App\Service;

use App\Interface\ITaskRepository;

class ToDoService
{
    private ITaskRepository $taskRepo; // Holds TaskRepository instance
    protected ?int $userId = null;     // Holds current user ID from session

    public function __construct(ITaskRepository $taskRepo)
    {
        $this->taskRepo = $taskRepo; // Inject TaskRepository

        // Start session if not already started
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->userId = $_SESSION['id'] ?? null; // Get user ID from session
    }

    // Return all tasks of the logged-in user
    public function listTasks(): array
    {
        if (!$this->userId) return []; // Return empty if not logged in
        return $this->taskRepo->getTasksByUser($this->userId); // Fetch tasks from repo
    }

    // Add a new task
    public function addTask(string $title, string $priority, ?string $due): bool
    {
        if (!$this->userId) return false; // Return false if not logged in
        return $this->taskRepo->addTask($this->userId, $title, $priority, $due); // Add task via repo
    }

    // Delete a task
    public function deleteTask(int $taskId): bool
    {
        if (!$this->userId) return false; // Return false if not logged in

        $this->taskRepo->logActivity($taskId, $this->userId, 'deleted'); // Log delete action
        return $this->taskRepo->deleteTask($taskId); // Delete task via repo
    }

    // Toggle task completion status
    public function toggleTask(int $taskId, bool $done): bool
    {
        if (!$this->userId) return false; // Return false if not logged in

        $success = $this->taskRepo->toggleTaskStatus($taskId, $done); // Update task status
        if ($success) 
        {
            $action = $done ? 'completed' : 'marked incomplete'; // Determine action
            $this->taskRepo->logActivity($taskId, $this->userId, $action); // Log action
        }
        return $success;
    }
}
