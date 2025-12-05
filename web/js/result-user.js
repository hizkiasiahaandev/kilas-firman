document.addEventListener("DOMContentLoaded", async () => {
    const params = new URLSearchParams(window.location.search);
    const roomCode = params.get("room");

    if (!roomCode) return (window.location.href = "join.html");

 
    const participant = JSON.parse(localStorage.getItem(`kilas_participant_${roomCode}`));
    if (!participant) {
        alert("Sesi hilang, silakan gabung ulang");
        return (window.location.href = "join.html");
    }

    const userName = participant.name;

    const result = await eel.calculate_result(roomCode, userName)();

    document.querySelector(".result-title").innerText = `Selamat, ${userName}!`;
    document.querySelector(".result-subtitle").innerText = `Kuis telah selesai`;

    document.querySelectorAll(".stat-val")[0].innerText = `${result.correct}/${result.total}`;
    document.querySelectorAll(".stat-val")[1].innerText = result.score;
    document.querySelectorAll(".stat-val")[2].innerText = `${result.accuracy}%`;

    await eel.finalize_result(roomCode, userName)();
});
