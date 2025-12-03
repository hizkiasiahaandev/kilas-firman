document.addEventListener("DOMContentLoaded", () => {
    const room = JSON.parse(localStorage.getItem("kilas_room"));
    if (!room) return;

    const roomNameEl = document.querySelector(".room-name-large");
    const hostNameEl = document.querySelector(".host-label");
    const roomCodeEl = document.getElementById("roomCode");
    const modeLabel = document.querySelector(".stat-item .stat-value");
    const questionStatus = document.querySelectorAll(".stat-item .stat-value")[1];
    const progressBar = document.querySelector(".progress-bar");
    const timeCreatedEl = document.querySelectorAll(".stat-item .stat-value")[2];
    const createQuestionLink = document.querySelector(".btn-create-q");
    const statusText = document.querySelector(".status-text");
    const participantsCount = document.querySelector(".stat-box h4");

    roomNameEl.textContent = room.roomName;
    hostNameEl.textContent = "Host: " + room.hostName;
    roomCodeEl.textContent = room.roomCode;

    if (room.mode === "random") {
        modeLabel.innerHTML = '<i class="fa-solid fa-shuffle" style="color:var(--secondary)"></i> Acak';
    } else {
        modeLabel.innerHTML = '<i class="fa-solid fa-list-ol" style="color:var(--secondary)"></i> Berurutan';
    }

    questionStatus.textContent = "0 dari " + room.totalQuestions;
    progressBar.style.width = "0%";

    const createdTime = new Date(room.createdAt);
    const now = new Date();
    const diff = Math.floor((now - createdTime) / 1000);
    timeCreatedEl.textContent = diff < 60 ? "Baru saja" : createdTime.toLocaleString();

    createQuestionLink.href = "create-questions.html?room=" + room.roomCode;

    participantsCount.textContent = 0;
    statusText.textContent = "Menunggu Soal";
});

function copyCode() {
    const code = document.getElementById('roomCode').innerText;
    navigator.clipboard.writeText(code);

    const btn = document.querySelector('.btn-icon-only');
    const originalHTML = btn.innerHTML;

    btn.innerHTML = '<i class="fa-solid fa-check" style="color:#10b981"></i>';
    btn.style.borderColor = '#10b981';

    setTimeout(() => {
        btn.innerHTML = originalHTML;
        btn.style.borderColor = '';
    }, 2000);
}
