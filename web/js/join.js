async function handleJoin(e) {
    e.preventDefault();

    const btn = document.querySelector(".btn-join");
    btn.disabled = true;
    btn.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin"></i> Menghubungkan...';

    const code = document.getElementById("roomCode").value.trim();
    const name = document.getElementById("userName").value.trim();

    if (!code || !name) {
        alert("Semua field wajib diisi");
        btn.disabled = false;
        btn.innerHTML = `Gabung Sekarang <i class="fa-solid fa-arrow-right"></i>`;
        return;
    }

    const room = await eel.get_room_data(code)();
    if (!room) {
        alert("Kode room tidak ditemukan");
        btn.disabled = false;
        btn.innerHTML = `Gabung Sekarang <i class="fa-solid fa-arrow-right"></i>`;
        return;
    }

    const status = await eel.add_participant(code, name)();
    if (!status || status.success !== true) {
        const msg = status?.message || "Gagal bergabung ke room";
        alert(msg);
        btn.disabled = false;
        btn.innerHTML = `Gabung Sekarang <i class="fa-solid fa-arrow-right"></i>`;
        return;
    }

    // 🔥 ambil data peserta dari database (100% akurat)
    const participants = await eel.get_participants(code)();
    const user = participants.find(p => p.participantName === name);

    if (!user) {
        alert("Gagal memvalidasi peserta dari server!");
        return;
    }

    localStorage.setItem(`kilas_participant_${code}`, JSON.stringify({
        name: user.participantName,
        roomCode: code
    }));

    alert("Berhasil bergabung!");
    window.location.href = `lobby.html?room=${code}`;
}
