let room = null;

document.addEventListener("DOMContentLoaded", async () => {
    const params = new URLSearchParams(window.location.search);
    const roomCode = params.get("room");
    if (!roomCode) return (window.location.href = "dashboard.html");

    room = await eel.get_room_data(roomCode)();
    if (!room) return (window.location.href = "dashboard.html");

    document.querySelector(".subtitle-quiz").innerText =
        `Performa peserta pada kuis "${room.roomName}"`;

    loadLeaderboard();
});

async function loadLeaderboard() {
    const data = await eel.get_leaderboard(room.roomCode)() || [];
    if (!data.length) return;

    updatePodium(1, data[0]);
    updatePodium(0, data[1]);
    updatePodium(2, data[2]);

    const tbody = document.querySelector("#rankingTable tbody");
    tbody.innerHTML = "";
    data.forEach((p, i) => {
        const isTop = i < 3 ? "top-rank" : "";
        tbody.innerHTML += `
    <tr class="${isTop}">
        <td class="rank-col">${i + 1}</td>
        <td>${p.name}</td>
        <td class="score-col">${p.score}</td>
        <td>${p.correct}</td>
        <td>${p.wrong}</td>
    </tr>
`;

    });
}

function updatePodium(positionIndex, pdata) {
    if (!pdata) return;
    const podiumEls = document.querySelectorAll(".podium-item");
    const el = podiumEls[positionIndex];

    el.querySelector(".winner-name").innerText = pdata.name;
    el.querySelector(".winner-score").innerText = `${pdata.score} Poin`;
    el.querySelector(".avatar").innerHTML = pdata.name.charAt(0).toUpperCase();
}
