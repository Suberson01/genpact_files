document.addEventListener('DOMContentLoaded', () => {
    // Simulated task data from database. Replace this with AJAX call to fetch real data.
    const tasks = [
        { id: 1, task: 'Task 1', status: 'pending' },
        { id: 2, task: 'Task 2', status: 'completed' },
        { id: 3, task: 'Task 3', status: 'pending' }
    ];

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
