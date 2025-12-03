const urlParams = new URLSearchParams(window.location.search);
const roomCode = urlParams.get("room");
const userName = urlParams.get("name");

// tampilkan kode
document.getElementById("roomCode").innerText = roomCode;

// render peserta tunggal
const pList = document.getElementById("pList");
const pCount = document.getElementById("pCount");

pList.innerHTML = `
    <div class="p-item">
        <div class="p-avatar" style="background:#3b82f6;">${userName.charAt(0).toUpperCase()}</div>
        <span class="p-name">${userName} (Anda)</span>
        <span class="p-status"><i class="fa-solid fa-circle-check"></i></span>
    </div>
`;
pCount.innerText = 1;

setTimeout(() => {
    window.location.href = `public-play.html?room=${roomCode}&name=${encodeURIComponent(userName)}`;
}, 1500);
