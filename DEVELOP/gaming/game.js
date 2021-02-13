function gameLoop() {
    aggiornaLogica();
    disegnaScena();
}

function init() {
    canvas.addEventListener('mousemove', mousemove, false);
    canvas.addEventListener('click', mouseclick, false);
    // Ripete il gameLoop() ogni 20 millisecondi
    intervallo = window.setInterval(gameLoop, 20);
}

// Dichiarazione variabili globali
canvas = document.getElementById("canvas");
contesto = canvas.getContext("2d");

var scorea = 0, scoreb = 0;
var ballx = (canvas.width / 2);
var bally = (canvas.height / 2);
var ballvx = 0, ballvy = 0;
var posy = 150;
var cpuy = 100;

function mousemove(ev) {
    if (ev.layerX || ev.layerX == 0) { // Firefox
        posy = ev.layerY;
    } else if (ev.offsetX || ev.offsetX == 0) { // Opera & Chrome
        posy = ev.offsetY;
    }
}

function mouseclick(ev) {
    if (ballvx == 0) { ballvx = 10; ballvy = 0.4; }
}

function disegnaScena() {
    // pulisco il canvas
    contesto.clearRect(0, 0, canvas.width, canvas.height);

    // definisco lo stile di riempimento
    contesto.fillStyle = "#fff";

    // disegno le barre
    contesto.fillRect(20, posy - 40, 10, 80);
    contesto.fillRect(canvas.width - 30, cpuy - 40, 10, 80);

    // disegno la pallina
    contesto.fillRect(ballx, bally, 8, 8);

    // scrivo i punteggi
    contesto.fillText("PLAYER: " + scorea, 40, 20);
    contesto.fillText("CPU: " + scoreb, canvas.width - 80, 20);
}

function aggiornaLogica() {
    // controllo cpu
    if (cpuy < bally) cpuy += 6;
    if (cpuy > bally) cpuy -= 6;

    // aggiorno dati e posizioni degli oggetti nella scena
    if (posy < 40) posy = 40;
    if (posy > canvas.height - 40) posy = canvas.height - 40;

    if (cpuy < 40) cpuy = 40;
    if (cpuy > canvas.height - 40) cpuy = canvas.height - 40;

    ballx += ballvx;
    bally += ballvy;


    // URTI PALLINA
    if ((ballvy > 0) && (bally >= canvas.height - 3)) ballvy = -ballvy;
    if ((ballvy < 0) && (bally <= 3)) ballvy = -ballvy;

    if ((ballvx > 0) && (ballx >= canvas.width - 30) && (ballx <= canvas.width - 15)) {

        if ((bally >= cpuy - 40) && (bally <= cpuy + 40)) {
            ballvx = - ((Math.random() * 5) + 10);
            ballvy = (Math.random() * 16) - 8;
        }
    }

    if (ballx > canvas.width) {
        scorea++; ballx = (canvas.width / 2);
        bally = (canvas.height / 2); ballvx = 0; ballvy = 0;
    }

    // URTI USER
    if ((ballvx < 0) && (ballx >= 25) && (ballx <= 40)) {

        if ((bally >= posy - 40) && (bally <= posy + 40)) {
            ballvx = ((Math.random() * 5) + 10);
            ballvy = (Math.random() * 16) - 8;
        }
    }

    if (ballx < 0) {
        scoreb++;
        ballx = (canvas.width / 2);
        bally = (canvas.height / 2);
        ballvx = 0; ballvy = 0;
    }
}

