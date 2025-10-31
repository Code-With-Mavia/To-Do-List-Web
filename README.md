# To-Do List Web App

A full-featured To-Do List application built with core PHP, featuring user authentication, task management, and a clean, responsive frontend.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Backup & Data](#backup--data)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About

This project is a robust To-Do List web app showcasing core PHP development with organized MVC-style folders. It includes login/signup, CRUD for tasks, and uses a SQL database for storage.

## Features

- User authentication (Register, Login)
- Create, read, update, and delete tasks
- View all tasks in a clean dashboard
- Responsive design with custom CSS
- Modular codebase (Controller, Service, Repository, Interface patterns)
- SQL database support & backup

## Project Structure

.
├── ImpCmdForComposer.txt
├── README.md
├── To-Do-List-Web # Submodule or legacy
│ └── README.md
├── Views # Frontend files
│ ├── css
│ │ └── style.css
│ ├── login_view.html
│ ├── logo.jpg
│ ├── signup_view.html
│ └── tasks_view.html
├── app # Backend logic
│ ├── Controller
│ │ ├── AuthController.php
│ │ └── ToDoController.php
│ ├── Core
│ │ └── Database.php
│ ├── Interface
│ │ ├── IAuthService.php
│ │ ├── ITaskRepository.php
│ │ └── IUserRepository.php
│ ├── Repository
│ │ ├── TaskRepository.php
│ │ └── UserRepository.php
│ └── Service
│ ├── AuthService.php
│ └── ToDoService.php
├── index.php
├── tasks.txt
├── todo_full_backup.sql
└── vendor # Composer dependencies
├── autoload.php
└── composer/

text

## Installation

1. **Clone the repository**
git clone https://github.com/Code-With-Mavia/To-Do-List-Web.git
cd To-Do-List-Web

text

2. **Install dependencies (if any)**
composer install

text
*(Requires Composer. See [Composer Setup](https://getcomposer.org/download/))* 

3. **Set up database**
- Import `todo_full_backup.sql` into your local MySQL or compatible database.
- Update connection details in `app/Core/Database.php`.

4. **Start the server**
php -S localhost:8000

text
Open [http://localhost:8000](http://localhost:8000) in your browser.

## Usage

- **Sign up / Login**: Start by authenticating yourself.
- **Task Dashboard**: Add, modify, and delete your daily tasks.
- **Backup**: Use `todo_full_backup.sql` for restoring previous data.

## Backup & Data

- `todo_full_backup.sql`: SQL file to restore the task database.
- `tasks.txt`: Quick reference for manual data/notes.

## Contributing

All contributions are welcome! Please open Issues or submit Pull Requests for new features, bug fixes, or code improvements.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Contact

**Maintainer**: Mavia Qaiser  
**GitHub**: [Code-With-Mavia](https://github.com/Code-With-Mavia)