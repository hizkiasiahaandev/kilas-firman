document.querySelector(".signup-form").addEventListener("submit", async (e) => {
    e.preventDefault();

    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    const res = await eel.register_user(username, email, password)();

    if (!res.success) {
        alert(res.message);
        return;
    }

    alert("Pendaftaran berhasil! Silakan login.");
    window.location.href = "login.html";


})