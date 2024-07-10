function handleFormSubmit() {
    const name = document.getElementById('name').value;
    const dob = document.getElementById('dob').value;
    const address = document.getElementById('address').value;
    const mobile = document.getElementById('mobile').value;
    const email = document.getElementById('email').value;
    const initialAmount = document.getElementById('initialAmount').value;
    const idProof = document.getElementById('idProof').files[0];

    if (!name || !dob || !address || !mobile || !email || !initialAmount || !idProof) {
        alert('Please fill all the fields.');
        return false;
    }

    if (mobile.length !== 10 || isNaN(mobile)) {
        alert('Please enter a valid 10-digit mobile number.');
        return false;
    }

    alert('Form submitted successfully!');
    console.log({
        name,
        dob,
        address,
        mobile,
        email,
        initialAmount,
        idProof
    });

    return false; // Prevent actual form submission for demonstration purposes
}
