<?php
namespace App\Controller;

// Import required classes
use App\Core\Database;
use App\Repository\TaskRepository;
use App\Service\ToDoService;

class ToDoController
{
    private ToDoService $service; // Holds instance of ToDoService

    public function __construct()
    {
        // Start session if not already started
        if (session_status() === PHP_SESSION_NONE) 
        {
            session_start();
        }

        // Initialize database and repository dependencies
        $db = new Database(); // Create database connection
        $taskRepo = new TaskRepository($db); // Create task repository
        $this->service = new ToDoService($taskRepo); // Inject repository into service
    }

    // Handle incoming HTTP requests
    public function handleRequest(): void
    {
        $action = $_GET['action'] ?? 'tasksView'; // Determine action from URL, default to tasks view

        switch ($action) {
            case 'getTasks': // Get list of tasks
                $this->getTasks();
                break;

            case 'addTask': // Add a new task
                $this->addTask();
                break;

            case 'deleteTask': // Delete a task
                $this->deleteTask();
                break;

            case 'toggleTask': // Mark task as done/undone
                $this->toggleTask();
                break;

            case 'tasksView': // Show tasks page
            default:
                $this->tasksView();
                break;
        }
    }

    // Get all tasks (optionally filter by priority)
    private function getTasks(): void
    {
        $tasks = $this->service->listTasks(); // Call service to get all tasks

        // Filter tasks by priority if provided in URL
        if (isset($_GET['priority']) && $_GET['priority'] !== '') 
        {
            $tasks = array_filter($tasks, fn($task) => $task['priority'] === $_GET['priority']);
        }

        $this->jsonResponse(array_values($tasks)); // Return JSON response
    }

    // Add a new task
    private function addTask(): void
    {
        $title = $_POST['title'] ?? ''; // Get title from POST
        $priority = $_POST['priority'] ?? 'Medium'; // Get priority from POST (default: Medium)
        $due = $_POST['due'] ?? null; // Get due date from POST (optional)

        $success = $this->service->addTask($title, $priority, $due); // Call service to add task
        $this->jsonResponse(['success' => $success]); // Return JSON response
    }

    // Delete a task
    private function deleteTask(): void
    {
        $taskId = intval($_GET['id'] ?? 0); // Get task ID from URL
        $success = $this->service->deleteTask($taskId); // Call service to delete task
        $this->jsonResponse(['success' => $success]); // Return JSON response
    }

    // Toggle task status (done/undone)
    private function toggleTask(): void
    {
        $taskId = intval($_GET['id'] ?? 0); // Get task ID from URL
        $done = intval($_GET['done'] ?? 0); // Get done status from URL

        $success = $this->service->toggleTask($taskId, $done); // Call service to toggle task
        $this->jsonResponse(['success' => $success]); // Return JSON response
    }

    // Render tasks HTML view
    private function tasksView(): void
    {
        // Redirect to login if user not logged in
        if (!isset($_SESSION['id'])) 
        {
            header("Location: index.php");
            exit;
        }

        // Include tasks view file
        include __DIR__ . '/../../Views/tasks_view.html';
    }

    // Return JSON response
    private function jsonResponse(array $data): void
    {
        header('Content-Type: application/json'); // Set JSON header
        echo json_encode($data); // Output JSON
    }
}
