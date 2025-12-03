let questions = [
    { text: "Apa ibu kota Indonesia?", score: 100, options: ["Jakarta","Surabaya","Bandung","Medan"], answer: 0 },
    { text: "Siapa proklamator Indonesia?", score: 100, options: ["Sukarno & Hatta","R.A Kartini","Diponegoro","Gatot Subroto"], answer: 0 },
    { text: "Gunung tertinggi di Indonesia?", score: 100, options: ["Semeru","Kerinci","Puncak Jaya","Rinjani"], answer: 2 }
];

let currentIndex = 0;
let timeLeft = 30;
let timerInterval = null;
let isAnswered = false;
let scoreTotal = 0;

document.addEventListener("DOMContentLoaded", () => {
    loadQuestion();
    startTimer();
});

function loadQuestion() {
    if (!questions[currentIndex]) return endQuiz();

    const q = questions[currentIndex];

    document.querySelector(".badge").innerText = `Soal ${currentIndex + 1} dari ${questions.length}`;
    document.querySelectorAll(".badge")[1].innerText = `Poin: ${q.score}`;
    document.querySelector(".q-text").innerText = q.text;

    const grid = document.getElementById("answersGrid");
    grid.innerHTML = "";
    isAnswered = false;
    timeLeft = 30;
    document.getElementById("timer").classList.remove("danger");

    q.options.forEach((opt, i) => {
        const btn = document.createElement("button");
        btn.className = "answer-card opt-" + ["a","b","c","d"][i];
        btn.innerText = opt;
        btn.onclick = () => submitAnswer(i, btn);
        grid.appendChild(btn);
    });

    document.getElementById("footerStatus").classList.remove("visible");
}

function submitAnswer(index, button) {
    if (isAnswered) return;
    isAnswered = true;

    button.classList.add("selected");

    if (index === questions[currentIndex].answer) {
        scoreTotal += questions[currentIndex].score;
    }

    document.getElementById("footerStatus").classList.add("visible");
}

function startTimer() {
    clearInterval(timerInterval);
    timerInterval = setInterval(() => {
        timeLeft--;
        document.getElementById("timer").innerText = timeLeft;

        if (timeLeft <= 10) document.getElementById("timer").classList.add("danger");

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

function endQuiz() {
    clearInterval(timerInterval);
    window.location.href = `result-user.html?score=${scoreTotal}&total=${questions.length}`;
}
