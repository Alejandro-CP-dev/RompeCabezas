// Configuración del rompecabezas
const FILAS = 3;
const COLUMNAS = 3;
const TOTAL_PIEZAS = FILAS * COLUMNAS;
const IMAGEN = "../Images/vicki.jpg";
const TAMANO_PIEZA = 100; // px, ajusta según el tamaño de tu imagen

let piezasColocadas = 0;
let tiempoInicio = Date.now();

// Se ejecuta al cargar la página
window.onload = function () {
    crearTablero();
    crearPiezas();
};

// Crea las casillas del tablero (donde van las piezas correctas)
function crearTablero() {
    const tablero = document.getElementById("tablero");
    tablero.style.width = (COLUMNAS * TAMANO_PIEZA) + "px";
    tablero.style.height = (FILAS * TAMANO_PIEZA) + "px";
    tablero.style.position = "relative";

    for (let i = 0; i < TOTAL_PIEZAS; i++) {
        const fila = Math.floor(i / COLUMNAS);
        const columna = i % COLUMNAS;

        const casilla = document.createElement("div");
        casilla.className = "casilla";
        casilla.dataset.posicion = i;
        casilla.style.left = (columna * TAMANO_PIEZA) + "px";
        casilla.style.top = (fila * TAMANO_PIEZA) + "px";
        casilla.style.width = TAMANO_PIEZA + "px";
        casilla.style.height = TAMANO_PIEZA + "px";

        // Permite soltar una pieza aquí
        casilla.addEventListener("dragover", function (e) { e.preventDefault(); });
        casilla.addEventListener("drop", soltarPieza);

        tablero.appendChild(casilla);
    }
}

// Crea las piezas desordenadas
function crearPiezas() {
    const contenedorPiezas = document.getElementById("piezas");
    const posiciones = [];

    for (let i = 0; i < TOTAL_PIEZAS; i++) {
        posiciones.push(i);
    }
    mezclar(posiciones);

    posiciones.forEach(function (posicionCorrecta) {
        const fila = Math.floor(posicionCorrecta / COLUMNAS);
        const columna = posicionCorrecta % COLUMNAS;

        const pieza = document.createElement("div");
        pieza.className = "pieza";
        pieza.draggable = true;
        pieza.dataset.posicionCorrecta = posicionCorrecta;
        pieza.style.width = TAMANO_PIEZA + "px";
        pieza.style.height = TAMANO_PIEZA + "px";
        pieza.style.backgroundImage = `url(${IMAGEN})`;
        pieza.style.backgroundPosition = `-${columna * TAMANO_PIEZA}px -${fila * TAMANO_PIEZA}px`;

        pieza.addEventListener("dragstart", function (e) {
            e.dataTransfer.setData("text/plain", posicionCorrecta);
        });

        contenedorPiezas.appendChild(pieza);
    });
}

// Cuando se suelta una pieza sobre una casilla
function soltarPieza(e) {
    e.preventDefault();

    const posicionCorrecta = e.dataTransfer.getData("text/plain");
    const posicionCasilla = e.currentTarget.dataset.posicion;

    if (posicionCorrecta === posicionCasilla) {
        // Encuentra la pieza que se estaba arrastrando y la coloca
        const piezas = document.querySelectorAll(".pieza");
        piezas.forEach(function (pieza) {
            if (pieza.dataset.posicionCorrecta === posicionCorrecta) {
                pieza.style.position = "absolute";
                pieza.style.left = e.currentTarget.style.left;
                pieza.style.top = e.currentTarget.style.top;
                pieza.draggable = false;
                pieza.classList.add("colocada");
                document.getElementById("tablero").appendChild(pieza);

                piezasColocadas++;
                verificarCompletado();
            }
        });
    }
}

// Revisa si ya se completó el rompecabezas
function verificarCompletado() {
    if (piezasColocadas === TOTAL_PIEZAS) {
        const tiempoSegundos = Math.floor((Date.now() - tiempoInicio) / 1000);

        document.getElementById("hdnTiempo").value = tiempoSegundos;
        document.getElementById("hdnCompletado").value = "true";

        // Dispara el postback hacia el servidor (guarda en BD y redirige)
        setTimeout(function () {
            document.getElementById("btnCompletado").click();
        }, 800); // pequeña pausa para que se vea la última pieza encajar
    }
}

// Mezcla el arreglo de posiciones (Fisher-Yates)
function mezclar(arreglo) {
    for (let i = arreglo.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [arreglo[i], arreglo[j]] = [arreglo[j], arreglo[i]];
    }
}