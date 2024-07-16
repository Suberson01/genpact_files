<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .task.pending {
            background-color: #f9f9f9;
        }

        .task.completed {
            background-color: #d4edda;
        }

        .toggle-button {
            padding: 5px 10px;
            cursor: pointer;
            border: none;
            border-radius: 3px;
        }

        .toggle-button.pending {
            background-color: #f0ad4e;
            color: white;
        }

        .toggle-button.completed {
            background-color: #5cb85c;
            color: white;
        }
    </style>
</head>
<body>
    <h2>My Tasks</h2>
    <table id="taskTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Task</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Task rows will be injected here by JavaScript -->
        </tbody>
    </table>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            fetch('tasks')
                .then(response => response.json())
                .then(tasks => {
                    const taskTableBody = document.querySelector('#taskTable tbody');

                    tasks.forEach(task => {
                        const taskRow = document.createElement('tr');
                        taskRow.className = `task ${task.status}`;
                        taskRow.dataset.id = task.id;

                        const idCell = document.createElement('td');
                        idCell.textContent = task.id;
                        taskRow.appendChild(idCell);

                        const taskCell = document.createElement('td');
                        taskCell.textContent = task.task;
                        taskRow.appendChild(taskCell);

                        const statusCell = document.createElement('td');
                        statusCell.textContent = task.status;
                        taskRow.appendChild(statusCell);

                        const actionCell = document.createElement('td');
                        const toggleButton = document.createElement('button');
                        toggleButton.className = `toggle-button ${task.status}`;
                        toggleButton.textContent = task.status === 'pending' ? 'Mark as Completed' : 'Mark as Pending';
                        toggleButton.addEventListener('click', () => toggleStatus(task.id));
                        actionCell.appendChild(toggleButton);
                        taskRow.appendChild(actionCell);

                        taskTableBody.appendChild(taskRow);
                    });
                })
                .catch(error => console.error('Error fetching tasks:', error));
        });

        function toggleStatus(taskId) {
            const taskRow = document.querySelector(`.task[data-id='${taskId}']`);
            const statusCell = taskRow.querySelector('td:nth-child(3)');
            const button = taskRow.querySelector('.toggle-button');

            if (taskRow.classList.contains('pending')) {
                taskRow.classList.remove('pending');
                taskRow.classList.add('completed');
                statusCell.textContent = 'completed';
                button.classList.remove('pending');
                button.classList.add('completed');
                button.textContent = 'Mark as Pending';
            } else {
                taskRow.classList.remove('completed');
                taskRow.classList.add('pending');
                statusCell.textContent = 'pending';
                button.classList.remove('completed');
                button.classList.add('pending');
                button.textContent = 'Mark as Completed';
            }
        }
    </script>
</body>
</html>
