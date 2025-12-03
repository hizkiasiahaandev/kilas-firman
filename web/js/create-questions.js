let room = null;
let questions = [];
let isEditing = false;
let MAX_QUESTIONS = 0;

document.addEventListener("DOMContentLoaded", () => {
    room = JSON.parse(localStorage.getItem("kilas_room"));
    if (!room) return;

    MAX_QUESTIONS = room.totalQuestions;

    document.querySelector(".room-info h2").textContent = room.roomName;
    document.querySelector(".badge-code").textContent = room.roomCode;
    document.querySelector(".room-meta span:nth-child(2)").innerHTML =
        room.mode === "random"
            ? '<i class="fa-solid fa-shuffle"></i> Mode: Acak'
            : '<i class="fa-solid fa-list-ol"></i> Mode: Berurutan';

    const saved = localStorage.getItem("kilas_questions_" + room.roomCode);
    questions = saved ? JSON.parse(saved) : [];

    document.getElementById("listCountBadge").textContent = `${questions.length} Soal`;

    renderAnswers();
    renderList();

    document.getElementById("questionForm").addEventListener("submit", handleSubmit);
});

function saveQuestions() {
    localStorage.setItem("kilas_questions_" + room.roomCode, JSON.stringify(questions));
}

function renderAnswers() {
    const type = document.getElementById("qType").value;
    const container = document.getElementById("answerSection");
    let html = "";

    if (type === "pg") {
        ["A", "B", "C", "D"].forEach((opt, idx) => {
            html += `
            <label class="answer-row">
                <input type="radio" name="correct_pg" class="correct-check" value="${opt}" ${idx===0?"checked":""}>
                <div class="option-marker">${opt}</div>
                <input type="text" class="option-input" id="opt_pg_${opt}" placeholder="Jawaban ${opt}" required>
            </label>`;
        });
    }

    if (type === "cb") {
        for (let i = 1; i <= 4; i++) {
            html += `
            <label class="answer-row">
                <input type="checkbox" name="correct_cb" class="correct-check" value="${i}">
                <div class="option-marker"><i class="fa-solid fa-check"></i></div>
                <input type="text" class="option-input" id="opt_cb_${i}" placeholder="Opsi ${i}">
            </label>`;
        }
    }

    if (type === "tf") {
        html = `
        <div class="tf-container">
            <label class="tf-option">
                <input type="radio" name="correct_tf" class="tf-radio" value="true" checked>
                BENAR
            </label>
            <label class="tf-option">
                <input type="radio" name="correct_tf" class="tf-radio" value="false">
                SALAH
            </label>
        </div>`;
    }

    container.innerHTML = html;
}

function handleSubmit(e) {
    e.preventDefault();

    if (!isEditing && questions.length >= MAX_QUESTIONS) {
        alert("Jumlah soal sudah mencapai batas maksimal: " + MAX_QUESTIONS);
        return;
    }

    const text = document.getElementById("qText").value.trim();
    const score = document.getElementById("qScore").value;
    const type = document.getElementById("qType").value;

    if (!text) return alert("Pertanyaan tidak boleh kosong");
    if (score < 1) return alert("Bobot skor minimal 1");

    let optionsData = [];
    let correctData = [];

    if (type === "pg") {
        let valid = true;
        ["A", "B", "C", "D"].forEach(opt => {
            const val = document.getElementById(`opt_pg_${opt}`).value.trim();
            if (!val) valid = false;
            optionsData.push({ id: opt, text: val });
        });
        if (!valid) return alert("Semua opsi harus diisi");
        const ck = document.querySelector('input[name="correct_pg"]:checked');
        if (ck) correctData.push(ck.value);
    }

    if (type === "cb") {
        let count = 0;
        for (let i = 1; i <= 4; i++) {
            const val = document.getElementById(`opt_cb_${i}`).value.trim();
            if (val) count++;
            optionsData.push({ id: i, text: val });
        }
        if (count < 2) return alert("Minimal isi 2 opsi checkbox");
        document.querySelectorAll('input[name="correct_cb"]:checked').forEach(c => correctData.push(c.value));
        if (!correctData.length) return alert("Pilih jawaban benar");
    }

    if (type === "tf") {
        optionsData = [
            { id: "true", text: "Benar" },
            { id: "false", text: "Salah" }
        ];
        const ck = document.querySelector('input[name="correct_tf"]:checked');
        if (ck) correctData.push(ck.value);
    }

    const newData = {
        id: isEditing ? parseInt(document.getElementById("qId").value) : Date.now(),
        text,
        type,
        score: parseInt(score),
        options: optionsData,
        correct: correctData
    };

    if (isEditing) {
        const idx = questions.findIndex(q => q.id === newData.id);
        if (idx !== -1) questions[idx] = newData;
    } else {
        questions.push(newData);
    }

    saveQuestions();
    renderList();
    resetForm();
}

function renderList() {
    const list = document.getElementById("questionsList");
    const badge = document.getElementById("listCountBadge");
    const empty = document.getElementById("emptyState");

    if (!questions.length) {
        empty.style.display = "block";
        list.innerHTML = "";
        list.appendChild(empty);
        badge.textContent = "0 Soal";
        return;
    }

    empty.style.display = "none";
    list.innerHTML = "";
    questions.forEach((q, i) => {
        const label = q.type === "pg" ? "MCQ" : q.type === "cb" ? "Checkbox" : "T/F";
        const el = document.createElement("div");
        el.className = "q-item";
        el.innerHTML = `
            <div class="q-number">${i + 1}</div>
            <div class="q-content">
                <div class="q-text">${q.text}</div>
                <div class="q-badges">
                    <span class="badge badge-type">${label}</span>
                    <span class="badge badge-score">${q.score} Poin</span>
                </div>
            </div>
            <div class="q-actions">
                <button class="btn-icon edit" onclick="editQuestion(${q.id})">
                    <i class="fa-solid fa-pen"></i>
                </button>
                <button class="btn-icon delete" onclick="deleteQuestion(${q.id})">
                    <i class="fa-solid fa-trash"></i>
                </button>
            </div>
        `;
        list.appendChild(el);
    });

    badge.textContent = `${questions.length} Soal`;
}

function editQuestion(id) {
    const q = questions.find(x => x.id === id);
    if (!q) return;

    isEditing = true;

    document.getElementById("formCard").classList.add("edit-mode");
    document.getElementById("formTitle").innerHTML =
        `<i class="fa-solid fa-pen-to-square"></i> Edit Soal #${indexById(id) + 1}`;
    document.getElementById("btnSubmit").innerHTML =
        `<i class="fa-solid fa-check"></i> Simpan Perubahan`;

    document.getElementById("btnCancel").style.display = "flex";
    document.getElementById("btnReset").style.display = "none";

    document.getElementById("qId").value = q.id;
    document.getElementById("qText").value = q.text;
    document.getElementById("qScore").value = q.score;
    document.getElementById("qType").value = q.type;

    renderAnswers();

    if (q.type === "pg") {
        q.options.forEach(o => document.getElementById(`opt_pg_${o.id}`).value = o.text);
        document.querySelector(`input[name="correct_pg"][value="${q.correct[0]}"]`).checked = true;
    }

    if (q.type === "cb") {
        q.options.forEach(o => document.getElementById(`opt_cb_${o.id}`).value = o.text);
        q.correct.forEach(c => document.querySelector(`input[name="correct_cb"][value="${c}"]`).checked = true);
    }

    if (q.type === "tf") {
        document.querySelector(`input[name="correct_tf"][value="${q.correct[0]}"]`).checked = true;
    }

    window.scrollTo({ top: 0, behavior: "smooth" });
}

function deleteQuestion(id) {
    if (!confirm("Yakin ingin menghapus soal ini?")) return;
    const idx = questions.findIndex(q => q.id === id);
    if (idx !== -1) questions.splice(idx, 1);
    saveQuestions();
    renderList();
    if (isEditing && parseInt(document.getElementById("qId").value) === id) resetForm();
}

function resetForm() {
    isEditing = false;
    document.getElementById("questionForm").reset();
    document.getElementById("formCard").classList.remove("edit-mode");
    document.getElementById("formTitle").innerHTML =
        `<i class="fa-solid fa-plus-circle"></i> Tambah Soal Baru`;
    document.getElementById("btnSubmit").innerHTML =
        `<i class="fa-solid fa-plus"></i> Tambah Soal`;
    document.getElementById("btnCancel").style.display = "none";
    document.getElementById("btnReset").style.display = "flex";
    renderAnswers();
}

function indexById(id) {
    return questions.findIndex(q => q.id === id);
}
