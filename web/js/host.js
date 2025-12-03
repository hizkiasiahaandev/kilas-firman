async function handleCreateRoom(e) {
    e.preventDefault();

    const btn = document.querySelector('.btn-submit');
    const originalText = btn.innerHTML;

    btn.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin"></i> Memproses...';
    btn.disabled = true;

    const inputs = document.querySelectorAll('.host-card .form-input, .host-card .form-select');

    const roomName = inputs[0].value.trim();
    const hostName = inputs[1].value.trim();
    const mode = inputs[2].value;
    const totalQuestions = Number(inputs[3].value);

 
    const roomCode = Math.floor(100000 + Math.random() * 900000);

    alert("Room berhasil dibuat!");

    
    window.location.href = `dashboard.html?room=${roomCode}&host=${encodeURIComponent(hostName)}&name=${encodeURIComponent(hostName)}&mode=${mode}&total=${totalQuestions}`;
}
