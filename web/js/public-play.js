let room = null;
let participant = null;
let questions = [];
let currentIndex = 0;
let timeLeft = 10;
let timerInterval = null;
let isAnswered = false;
let selectedAnswers = [];

document.addEventListener("DOMContentLoaded", async () => {
    const params = new URLSearchParams(window.location.search);
    const roomCode = params.get("room");

    participant = JSON.parse(localStorage.getItem(`kilas_participant_${roomCode}`));
    if (!participant) {
        alert("Data peserta hilang, silakan join ulang");
        return (window.location.href = "join.html");
    }

    room = await eel.get_room_data(roomCode)();
    if (!room) return (window.location.href = "join.html");

    questions = await eel.get_questions(roomCode)() || [];
    if (!questions.length) return alert("Belum ada soal!");

    loadQuestion();
    startTimer();
    setInterval(checkStopByHost, 2000);
});

function loadQuestion() {
    if (!questions[currentIndex]) return endQuiz();

    const q = questions[currentIndex];
    const options = JSON.parse(q.options);
    const correctList = JSON.parse(q.correct);

    document.querySelector(".badge").innerText =
        `Soal ${currentIndex + 1} dari ${questions.length}`;
    document.querySelectorAll(".badge")[1].innerText = `Poin: ${q.qScore}`;
    document.querySelector(".q-text").innerText = q.qText;

    const grid = document.getElementById("answersGrid");
    grid.innerHTML = "";
    isAnswered = false;
    selectedAnswers = [];
    timeLeft = 30;

    document.getElementById("timer").classList.remove("danger");
    document.getElementById("footerStatus").classList.remove("visible");

    options.forEach((opt, i) => {
        const btn = document.createElement("button");
        btn.className = "answer-card opt-" + ["a", "b", "c", "d"][i];
        btn.innerText = opt.text;
        btn.onclick = () => submitAnswer(opt.id, correctList, btn);
        grid.appendChild(btn);
    });
}

async function submitAnswer(selectedId, correctList, btn) {
    if (isAnswered) return;

    const alreadyAnswered = await eel.has_answer(
        room.roomCode,
        participant.name,
        questions[currentIndex].id
    )();

    if (alreadyAnswered) {
        isAnswered = true;
        document.getElementById("footerStatus").classList.add("visible");
        return;
    }

    if (!selectedAnswers.includes(selectedId)) {
        selectedAnswers.push(selectedId);
        btn.classList.add("selected");
    }

    const qScore = Number(questions[currentIndex].qScore) || 0;
    const isSingle = correctList.length === 1;

    if (isSingle) {
        const isCorrect = correctList.includes(selectedId) ? 1 : 0;
        eel.submit_answer(room.roomCode, participant.name, questions[currentIndex].id, isCorrect, qScore)();
        finishQuestion();
        return;
    }

    if (selectedAnswers.length === correctList.length) {
        selectedAnswers.sort();
        correctList.sort();
        const allCorrect = JSON.stringify(selectedAnswers) === JSON.stringify(correctList) ? 1 : 0;
        eel.submit_answer(room.roomCode, participant.name, questions[currentIndex].id, allCorrect, qScore)();
        finishQuestion();
    }
}

function finishQuestion() {
    isAnswered = true;
    document.getElementById("footerStatus").classList.add("visible");

    // Lock buttons
    document.querySelectorAll(".answer-card").forEach(btn => btn.disabled = true);
}

function startTimer() {
    clearInterval(timerInterval);
    timerInterval = setInterval(() => {
        timeLeft--;
        document.getElementById("timer").innerText = timeLeft;

        if (timeLeft <= 10)
            document.getElementById("timer").classList.add("danger");

        if (timeLeft <= 0) nextQuestion();
    }, 1000);
}

function nextQuestion() {
    clearInterval(timerInterval);
    currentIndex++;
    if (currentIndex < questions.length) {
        loadQuestion();
        startTimer();
    } else {
        endQuiz();
    }
}

async function checkStopByHost() {
    const status = await eel.get_room_status(room.roomCode)();
    if (status === "finished") endQuiz();
}

async function endQuiz() {
    clearInterval(timerInterval);
    await eel.finalize_result(room.roomCode, participant.name)();
    window.location.href =
        `result-user.html?room=${room.roomCode}&user=${participant.name}`;
}
