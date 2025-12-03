function handleJoin(e) {
    e.preventDefault();

    const roomCode = document.getElementById("roomCode").value.trim();
    const userName = document.getElementById("userName").value.trim();

    alert("Berhasil masuk ke room!");

    window.location.href = `lobby.html?room=${roomCode}&name=${encodeURIComponent(userName)}`;
}