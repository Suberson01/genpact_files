let balance = 0.00;

function updateBalance() {
    localStorage.setItem('balance', balance.toFixed(2));
    if (document.getElementById('balance')) {
        document.getElementById('balance').innerText = `$${balance.toFixed(2)}`;
    }
}

function handleDeposit() {
    let amount = document.getElementById('depositAmount').value;
    if (amount && !isNaN(amount)) {
        balance += parseFloat(amount);
        updateBalance();
        alert('Deposit successful!');
        window.location.href = 'dashboard.html';
        return false; // Prevent form submission
    } else {
        alert("Please enter a valid number.");
        return false;
    }
}

function handleWithdraw() {
    let amount = document.getElementById('withdrawAmount').value;
    if (amount && !isNaN(amount)) {
        if (parseFloat(amount) <= balance) {
            balance -= parseFloat(amount);
            updateBalance();
            alert('Withdrawal successful!');
            window.location.href = 'dashboard.html';
            return false; // Prevent form submission
        } else {
            alert("Insufficient balance.");
            return false;
        }
    } else {
        alert("Please enter a valid number.");
        return false;
    }
}

window.onload = function() {
    balance = parseFloat(localStorage.getItem('balance')) || 0.00;
    if (document.getElementById('balance')) {
        document.getElementById('balance').innerText = `$${balance.toFixed(2)}`;
    }
}
