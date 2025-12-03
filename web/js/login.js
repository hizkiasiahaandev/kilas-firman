document.querySelector(".login-form").addEventListener("submit", async (e) => {
    e.preventDefault();

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    const res = await eel.login_user(email, password)();

    if (!res.success) {
        alert(res.message);
        return;
    }

    createSession(res.user);
    alert("Login berhasil!");
    window.location.href = "../../pages/index.html";
});

document.getElementById("togglePassword").addEventListener("click", function () {
    const input = document.getElementById("password");
    input.type = input.type === "password" ? "text" : "password";
});
