document.addEventListener("DOMContentLoaded", () => {
    loadRoomData();
});

function loadRoomData() {
    const roomName = "Kuis IPS Kelas XII";
    const roomCode = "482913";
    const hostName = "Hizkia Pratama"; 

    document.getElementById("roomNameDisplay").innerText = roomName;
    document.getElementById("roomCodeDisplay").innerText = roomCode;
    document.getElementById("hostNameDisplay").innerText = `Host: ${hostName}`;


    const participants = [
        { name: "Andi Saputra" },
        { name: "Rika Amelia" },
        { name: "Budi Santoso" },
        { name: "Salsabila" },
        { name: "Deni Rahman" },
        { name: "Eka Putri" },
        { name: "Fajar Nugraha" },
        { name: "Gita Pertiwi" }
    ];

    renderParticipants(participants);
}

function renderParticipants(list) {
    const listContainer = document.getElementById("participantsList");
    const countBadge = document.getElementById("participantCount");

    countBadge.innerText = list.length;
    listContainer.innerHTML = "";

    if (list.length === 0) {
        listContainer.innerHTML = `
        <div style="text-align:center; padding:20px; color:var(--text-muted);">
            Belum ada peserta bergabung.
        </div>`;
        return;
    }

    list.forEach(p => {
        const initial = p.name.charAt(0).toUpperCase();
        const itemHtml = `
            <div class="p-item">
                <div class="p-name">
                    <div class="p-avatar">${initial}</div>
                    ${p.name}
                </div>
            </div>
        `;
        listContainer.innerHTML += itemHtml;
    });
}

function endSession() {
    if (confirm("Apakah Anda yakin ingin mengakhiri sesi kuis ini?")) {
        window.location.href = "result-host.html";
    }
}
