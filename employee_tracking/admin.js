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
    const startTimeInput = document.getElementById('startTime');
    const endTimeInput = document.getElementById('endTime');
    const task = taskInput.value;
    const startTime = startTimeInput.value;
    const endTime = endTimeInput.value;
    if (task && startTime && endTime) {
        const li = document.createElement('li');
        li.textContent = `${task} (from ${startTime} to ${endTime})`;
        document.getElementById('todoList').appendChild(li);
        taskInput.value = '';
        startTimeInput.value = '';
        endTimeInput.value = '';
    }
});

document.getElementById('sendListBtn').addEventListener('click', function() {
    const userId = document.getElementById('userId').value;
    const tasks = [];
    document.querySelectorAll('#todoList li').forEach(li => tasks.push(li.textContent));
    alert(`Tasks for ${userId}:\n${tasks.join('\n')}`);
});
