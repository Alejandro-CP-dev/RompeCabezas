<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sorpresa.aspx.cs" Inherits="RompeCabezas.Vista.Sorpresa" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Para ti</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,500..900;1,500..900&amp;family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&amp;display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="Styles/circular-gallery.css" />
    <script id="tailwind-config">
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        "surface": "#170e0d",
                        "surface-container-lowest": "#2b1719",
                        "on-surface": "#ede1c8",
                        "on-surface-variant": "#c9b28f",
                        "primary": "#8a1c26",
                        "gold": "#af8c4f",
                        "gold-light": "#e4cf9c",
                        "outline-variant": "#4a2e2c"
                    },
                    fontFamily: {
                        "display": ["Playfair Display"],
                        "headline": ["EB Garamond"],
                        "body": ["Plus Jakarta Sans"]
                    }
                }
            }
        }
    </script>
    <style>
        body {
            background-color: #170e0d;
            background-image:
                radial-gradient(circle at 50% 10%, rgba(138,28,38,0.18) 0%, transparent 55%),
                radial-gradient(circle at 50% 100%, rgba(0,0,0,0.6) 0%, transparent 70%);
            overflow-x: hidden;
        }

        /* ---- Polillas de fondo ---- */
        .polilla {
            position: absolute;
            opacity: 0;
            animation: revolotear 14s ease-in-out infinite;
        }
        @keyframes revolotear {
            0%   { transform: translate(0, 0) rotate(0deg); opacity: 0; }
            10%  { opacity: 0.35; }
            50%  { transform: translate(30px, -40px) rotate(8deg); }
            90%  { opacity: 0.35; }
            100% { transform: translate(-20px, -90px) rotate(-6deg); opacity: 0; }
        }

        /* ---- Estrella de papel doblada (cerrada) ---- */
        .estrella-wrap {
            cursor: pointer;
        }
        .estrella-cerrada {
            width: 260px;
            height: 260px;
            filter: drop-shadow(0 20px 40px rgba(0,0,0,0.55));
            transition: transform 1s cubic-bezier(.6,-0.28,.74,.05), opacity 0.6s ease;
        }
        .estrella-wrap.abierto .estrella-cerrada {
            transform: rotate(160deg) scale(0.3);
            opacity: 0;
        }
        .estrella-wrap.oculto {
            display: none;
        }
        .estrella-cerrada-texto {
            color: #c9b28f;
            font-family: 'EB Garamond', serif;
            font-style: italic;
            font-size: 14px;
        }

        /* ---- Carta abierta: pergamino con marco ornamentado y líneas ---- */
        .carta-oculta { display: none; }
        .carta-visible {
            display: flex;
            animation: aparecerCarta 1s ease-out forwards;
        }
        @keyframes aparecerCarta {
            from { opacity: 0; transform: translateY(20px) scale(0.97); }
            to   { opacity: 1; transform: translateY(0) scale(1); }
        }

        .pergamino {
            position: relative;
            background:
                repeating-linear-gradient(
                    to bottom,
                    transparent 0px, transparent 34px,
                    rgba(175,140,79,0.25) 35px
                ),
                linear-gradient(160deg, #f3e6c3 0%, #e8d3a3 100%);
            border: 1px solid #af8c4f;
            box-shadow:
                0 0 0 6px #170e0d,
                0 0 0 7px #af8c4f,
                0 25px 60px rgba(0,0,0,0.6);
            padding: 44px 32px 32px;
        }

        .esquina-orn {
            position: absolute;
            width: 34px;
            height: 34px;
            border: 2px solid #af8c4f;
            opacity: 0.8;
        }
        .esquina-orn.tl { top: 8px; left: 8px; border-right: none; border-bottom: none; }
        .esquina-orn.tr { top: 8px; right: 8px; border-left: none; border-bottom: none; }
        .esquina-orn.bl { bottom: 8px; left: 8px; border-right: none; border-top: none; }
        .esquina-orn.br { bottom: 8px; right: 8px; border-left: none; border-top: none; }

        .pergamino .texto-carta {
            color: #3d2b16;
        }

        .contador-caja {
            background: #241513;
            border: 1px solid #4a2e2c;
            border-radius: 8px;
            min-width: 72px;
        }
    </style>
</head>
<body class="min-h-screen font-body text-on-surface flex flex-col items-center p-6 relative">

    <div id="polillas-container" class="fixed inset-0 pointer-events-none z-0"></div>

    <form id="form1" runat="server">
        <main class="relative z-10 w-full max-w-[560px] mx-auto flex flex-col items-center text-center gap-10 py-10">

            <!-- Estrella de papel cerrada: clic para abrir -->
            <div id="sobre" class="estrella-wrap flex flex-col items-center justify-center gap-5" onclick="abrirCarta()">
                <h1 class="font-display text-3xl text-gold tracking-wide">Tiene algo para ti</h1>

                <svg class="estrella-cerrada" viewBox="0 0 300 300" xmlns="http://www.w3.org/2000/svg">
                    <!-- Cuerpo de la estrella de papel -->
                    <path d="M150,20 L179.4,109.5 L273.6,109.8 L197.6,165.4 L226.4,255.2 L150,200 L73.6,255.2 L102.4,165.4 L26.4,109.8 L120.6,109.5 Z"
                          fill="#f3ecd9" stroke="#a3895f" stroke-width="1.5" />

                    <!-- Pliegues (líneas de dobleces del papel) -->
                    <g stroke="#b8a377" stroke-width="0.8" opacity="0.6">
                        <line x1="150" y1="150" x2="150" y2="20" />
                        <line x1="150" y1="150" x2="273.6" y2="109.8" />
                        <line x1="150" y1="150" x2="226.4" y2="255.2" />
                        <line x1="150" y1="150" x2="73.6" y2="255.2" />
                        <line x1="150" y1="150" x2="26.4" y2="109.8" />
                        <line x1="150" y1="150" x2="179.4" y2="109.5" />
                        <line x1="150" y1="150" x2="197.6" y2="165.4" />
                        <line x1="150" y1="150" x2="102.4" y2="165.4" />
                        <line x1="150" y1="150" x2="120.6" y2="109.5" />
                        <line x1="150" y1="150" x2="150" y2="200" />
                    </g>

                    <!-- Garabatos botánicos, uno por punta -->
                    <g stroke="#4a3a22" stroke-width="1.2" fill="none" stroke-linecap="round">
                        <!-- helecho arriba -->
                        <g transform="translate(150,65)">
                            <line x1="0" y1="20" x2="0" y2="-20" />
                            <line x1="0" y1="10" x2="-10" y2="2" /><line x1="0" y1="0" x2="10" y2="-8" />
                            <line x1="0" y1="-5" x2="-9" y2="-13" /><line x1="0" y1="-15" x2="8" y2="-20" />
                        </g>
                        <!-- estrellitas derecha -->
                        <g transform="translate(228,138)" stroke-width="1">
                            <path d="M0,-6 L0,6 M-6,0 L6,0 M-4,-4 L4,4 M-4,4 L4,-4" />
                            <path d="M18,4 L18,12 M14,8 L22,8" />
                        </g>
                        <!-- flor abajo-derecha -->
                        <g transform="translate(196,206)">
                            <line x1="0" y1="18" x2="0" y2="-6" />
                            <circle cx="0" cy="-10" r="4" />
                            <circle cx="-6" cy="-4" r="3.5" />
                            <circle cx="6" cy="-4" r="3.5" />
                        </g>
                        <!-- flor abajo-izquierda -->
                        <g transform="translate(104,206)">
                            <line x1="0" y1="18" x2="0" y2="-6" />
                            <path d="M-8,4 Q0,-6 8,4" />
                        </g>
                        <!-- rama izquierda -->
                        <g transform="translate(72,138)">
                            <line x1="0" y1="-18" x2="0" y2="18" />
                            <ellipse cx="-7" cy="-6" rx="6" ry="3" transform="rotate(-30 -7 -6)" />
                            <ellipse cx="7" cy="6" rx="6" ry="3" transform="rotate(30 7 6)" />
                        </g>
                    </g>
                </svg>

                <div class="estrella-cerrada-texto">toca la estrella para abrirla</div>
            </div>

            <!-- Contenido revelado -->
            <div id="contenido" class="carta-oculta flex-col items-center gap-10 w-full">

                <div class="flex flex-col gap-2 items-center">
                    <span class="text-gold text-2xl">✦</span>
                    <h1 class="font-display text-4xl text-on-surface">Lo lograste</h1>
                    <p class="text-on-surface-variant font-headline italic text-lg">Esto es lo que tenía guardado para ti.</p>
                </div>

                <div class="pergamino w-full relative">
                    <span class="esquina-orn tl"></span>
                    <span class="esquina-orn tr"></span>
                    <span class="esquina-orn bl"></span>
                    <span class="esquina-orn br"></span>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="texto-carta font-headline text-2xl italic leading-relaxed" />
                </div>

                <div class="flex flex-col items-center gap-3">
                    <p class="font-display text-xl text-gold">cada segundo contigo</p>
                    <div class="flex gap-3">
                        <div class="contador-caja px-4 py-3">
                            <div id="dias" class="font-display text-3xl text-gold">0</div>
                            <div class="text-[11px] uppercase tracking-wide text-on-surface-variant">días</div>
                        </div>
                        <div class="contador-caja px-4 py-3">
                            <div id="horas" class="font-display text-3xl text-gold">0</div>
                            <div class="text-[11px] uppercase tracking-wide text-on-surface-variant">horas</div>
                        </div>
                        <div class="contador-caja px-4 py-3">
                            <div id="minutos" class="font-display text-3xl text-gold">0</div>
                            <div class="text-[11px] uppercase tracking-wide text-on-surface-variant">min</div>
                        </div>
                        <div class="contador-caja px-4 py-3">
                            <div id="segundos" class="font-display text-3xl text-gold">0</div>
                            <div class="text-[11px] uppercase tracking-wide text-on-surface-variant">seg</div>
                        </div>
                    </div>
                    <p class="text-on-surface-variant text-sm max-w-[340px]">Así de mucho tiempo llevamos juntos, y no me arrepiento de un solo segundo.</p>
                </div>

                <div class="w-full flex flex-col items-center gap-3">
                    <p class="font-display text-xl text-gold">nuestros momentos</p>
                    <div id="galeria" style="width:100%; height:340px; position:relative;"></div>
                    <p class="text-on-surface-variant text-xs italic">arrastra o usa la rueda del mouse para recorrer las fotos</p>
                </div>

                <div class="w-full flex flex-col items-center gap-3">
                    <p class="font-display text-xl text-gold">nuestra playlist</p>
                    <iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/37i9dQZF1DXcBWIGoYBM5M?utm_source=generator&theme=0"
                        width="100%" height="352" frameborder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy">
                    </iframe>
                </div>

            </div>
        </main>

        <script>
            function crearPolilla() {
                const svgPolilla = `
                    <svg width="26" height="20" viewBox="0 0 26 20" xmlns="http://www.w3.org/2000/svg">
                        <ellipse cx="13" cy="10" rx="2" ry="6" fill="#af8c4f" opacity="0.8"/>
                        <path d="M13 6 C6 -2, -3 4, 4 12 C8 15, 12 11, 13 6 Z" fill="#c9b28f" opacity="0.55"/>
                        <path d="M13 6 C20 -2, 29 4, 22 12 C18 15, 14 11, 13 6 Z" fill="#c9b28f" opacity="0.55"/>
                    </svg>`;

                const contenedor = document.getElementById('polillas-container');
                const numPolillas = 14;
                for (let i = 0; i < numPolillas; i++) {
                    const p = document.createElement('div');
                    p.className = 'polilla';
                    p.innerHTML = svgPolilla;
                    p.style.left = (Math.random() * 100) + 'vw';
                    p.style.top = (Math.random() * 100) + 'vh';
                    p.style.animationDelay = (Math.random() * 14) + 's';
                    p.style.animationDuration = (10 + Math.random() * 10) + 's';
                    const escala = 0.7 + Math.random() * 1.3;
                    p.style.transform = `scale(${escala})`;
                    contenedor.appendChild(p);
                }
            }
            crearPolilla();

            function abrirCarta() {
                const sobre = document.getElementById('sobre');
                if (sobre.classList.contains('abierto')) return;

                sobre.classList.add('abierto');

                setTimeout(function () {
                    sobre.classList.add('oculto');
                    const contenido = document.getElementById('contenido');
                    contenido.classList.remove('carta-oculta');
                    contenido.classList.add('carta-visible');
                    iniciarContador();
                }, 1000);
            }

            function iniciarContador() {
                // ⚠️ Cambia esta fecha por la fecha real de aniversario (formato: 'YYYY-MM-DDTHH:MM:SS')
                const FECHA_INICIO = new Date('2024-01-01T00:00:00');

                function actualizar() {
                    const ahora = new Date();
                    const diferencia = ahora - FECHA_INICIO;

                    const dias = Math.floor(diferencia / (1000 * 60 * 60 * 24));
                    const horas = Math.floor((diferencia / (1000 * 60 * 60)) % 24);
                    const minutos = Math.floor((diferencia / (1000 * 60)) % 60);
                    const segundos = Math.floor((diferencia / 1000) % 60);

                    document.getElementById('dias').textContent = dias;
                    document.getElementById('horas').textContent = horas;
                    document.getElementById('minutos').textContent = minutos;
                    document.getElementById('segundos').textContent = segundos;
                }

                actualizar();
                setInterval(actualizar, 1000);
            }
        </script>
            <script type="module" src="../Scripts/circular-gallery.js"></script>
    </form>
</body>
</html>



