document.addEventListener("DOMContentLoaded", () => {
    const placeholder = document.getElementById("navbar-placeholder");

    fetch("navbar.html")
        .then(res => res.text())
        .then(html => {
            placeholder.innerHTML = html;
        })
        .catch(err => console.error("Error loading navbar:", err));
});

function updateNavbarSession() {}

function logoutUser() {}
