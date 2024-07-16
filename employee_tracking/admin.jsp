<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("admin.jpg");
            background-color: #f0f0f0;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        h1, h2 {
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            margin-bottom: 10px;
            width: calc(100% - 22px);
            box-sizing: border-box;
        }

        button {
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background: #f9f9f9;
            margin: 5px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>To-Do List</h1>
        <form id="userForm">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" required>
            <button type="submit">Submit</button>
        </form>
        <div id="todoSection" style="display:none;">
            <h2>Tasks for <span id="displayUserId"></span></h2>
            <form id="todoForm">
                <input type="text" id="taskInput" placeholder="New Task" required>
                <button type="submit">Add Task</button>
            </form>
            <ul id="todoList"></ul>
            <button id="sendListBtn">Send To-Do List</button>
        </div>
    </div>
    <script>
        document.getElementById('userForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const userId = document.getElementById('userId').value;
            document.getElementById('displayUserId').innerText = userId;
            document.getElementById('userForm').style.display = 'none';
            document.getElementById('todoSection').style.display = 'block';
        });

        document.getElementById('todoForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const taskInput = document.getElementById('taskInput');
            const task = taskInput.value;
            if (task) {
                const li = document.createElement('li');
                li.textContent = task;
                document.getElementById('todoList').appendChild(li);
                taskInput.value = '';
            }
        });

        document.getElementById('sendListBtn').addEventListener('click', function() {
            const userId = document.getElementById('userId').value;
            const tasks = [];
            document.querySelectorAll('#todoList li').forEach(li => tasks.push(li.textContent));
            alert(`Tasks for ${userId}:\n${tasks.join('\n')}`);
        });
    </script>
</body>
</html>
