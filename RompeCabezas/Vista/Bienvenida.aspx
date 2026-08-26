<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bienvenida.aspx.cs" Inherits="RompeCabezas.Vista.Bienvenida" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Nuestra Historia en Piezas</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,500..900;1,500..900&amp;family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        "surface": "#f6ecda",
                        "surface-container-lowest": "#fffdf7",
                        "on-surface": "#2b2118",
                        "on-surface-variant": "#5c4a35",
                        "primary": "#7c1f2a",
                        "primary-variant": "#5a1620",
                        "gold": "#af8c4f",
                        "gold-light": "#e4cf9c",
                        "outline-variant": "#d9c6a0"
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
            background-color: #f6ecda;
            background-image: radial-gradient(circle at 20% 20%, rgba(175,140,79,0.08) 0%, transparent 40%), radial-gradient(circle at 80% 80%, rgba(124,31,42,0.06) 0%, transparent 40%), url("data:image/svg+xml,%3Csvg width='120' height='120' viewBox='0 0 120 120' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' stroke='%23af8c4f' stroke-width='0.5' opacity='0.15'%3E%3Cpath d='M60 0 L120 60 L60 120 L0 60 Z'/%3E%3C/g%3E%3C/svg%3E");
        }

        .marco {
            position: relative;
            border: 1px solid #af8c4f;
            box-shadow: 0 0 0 6px #fffdf7, 0 0 0 7px #af8c4f, 0 20px 50px rgba(92, 22, 32, 0.15);
        }

        .esquina {
            position: absolute;
            width: 28px;
            height: 28px;
            border: 2px solid #af8c4f;
        }

        .esquina-tl {
            top: -14px;
            left: -14px;
            border-right: none;
            border-bottom: none;
        }

        .esquina-tr {
            top: -14px;
            right: -14px;
            border-left: none;
            border-bottom: none;
        }

        .esquina-bl {
            bottom: -14px;
            left: -14px;
            border-right: none;
            border-top: none;
        }

        .esquina-br {
            bottom: -14px;
            right: -14px;
            border-left: none;
            border-top: none;
        }

        .divisor-floral::before,
        .divisor-floral::after {
            content: "";
            display: inline-block;
            width: 40px;
            height: 1px;
            background: #af8c4f;
            vertical-align: middle;
            margin: 0 12px;
        }

        @keyframes float {
            0% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0;
            }

            10% {
                opacity: 0.5;
            }

            90% {
                opacity: 0.5;
            }

            100% {
                transform: translateY(-120px) rotate(15deg);
                opacity: 0;
            }
        }

        .particula-dorada {
            animation: float 9s ease-in-out infinite;
            position: absolute;
        }
    </style>
</head>
<body class="min-h-screen text-on-surface font-body relative flex flex-col items-center justify-center p-6">
    <form id="form1" runat="server">
        <div class="fixed inset-0 pointer-events-none overflow-hidden z-0">
            <div id="particula-container"></div>
            <div class="absolute top-[-10%] left-[-10%] w-[50vw] h-[50vw] rounded-full bg-gold-light blur-[110px] opacity-30"></div>
            <div class="absolute bottom-[-20%] right-[-10%] w-[60vw] h-[60vw] rounded-full bg-primary blur-[130px] opacity-[0.06]"></div>
        </div>

        <main class="relative z-10 w-full max-w-[600px] mx-auto flex flex-col items-center text-center gap-8">

            <div class="text-gold opacity-90">
                <svg width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2 L14 9 L21 9 L15.5 13.5 L17.5 21 L12 16.5 L6.5 21 L8.5 13.5 L3 9 L10 9 Z" stroke="#af8c4f" stroke-width="1" fill="#e4cf9c" />
                </svg>
            </div>

            <div class="flex flex-col gap-3 items-center">
                <h1 class="font-display text-4xl md:text-5xl text-primary tracking-wide">Nuestra Historia en Piezas</h1>
                <p class="divisor-floral font-headline text-xl text-on-surface-variant italic">un recuerdo, guardado para ti</p>
            </div>

            <div class="marco w-full bg-surface-container-lowest p-3 mt-4">
                <span class="esquina esquina-tl"></span>
                <span class="esquina esquina-tr"></span>
                <span class="esquina esquina-bl"></span>
                <span class="esquina esquina-br"></span>

                <div class="aspect-[4/3] w-full overflow-hidden relative">
                    <img alt="Girasol en primer plano" class="w-full h-full object-cover"
                        src="https://images.unsplash.com/photo-1591385059241-220496bc6b7c?fm=jpg&amp;q=80&amp;w=1200&amp;auto=format&amp;fit=crop" />
                </div>
                <div class="mt-6 mb-3 px-4">
                    <p class="font-headline text-xl text-on-surface-variant italic leading-relaxed">
                        "Feliz Aniversario, mi vida. He preparado algo especial para celebrar nuestro tiempo juntos."
                    </p>
                </div>
            </div>

            <div class="mt-2">
                <asp:Button ID="btnComenzar" runat="server" Text="Empezar el Rompecabezas"
                    CssClass="bg-primary text-surface-container-lowest font-headline text-lg tracking-wide px-10 py-3 border border-gold shadow-[0px_4px_20px_rgba(124,31,42,0.3)] hover:bg-primary-variant transition-all duration-300 active:scale-95"
                    OnClick="btnComenzar_Click" />
            </div>

            <div class="mt-4 font-display text-xl text-primary italic">Always &amp; Forever</div>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const container = document.getElementById('particula-container');
                const numParticulas = 18;
                for (let i = 0; i < numParticulas; i++) {
                    const p = document.createElement('span');
                    p.className = 'particula-dorada';
                    p.innerHTML = '✦';
                    p.style.color = '#af8c4f';
                    const leftPos = Math.random() * 100;
                    const topPos = Math.random() * 100 + 50;
                    const delay = Math.random() * 9;
                    const duration = 7 + Math.random() * 6;
                    const scale = 0.6 + Math.random() * 1.2;
                    p.style.left = `${leftPos}vw`;
                    p.style.top = `${topPos}vh`;
                    p.style.animationDelay = `${delay}s`;
                    p.style.animationDuration = `${duration}s`;
                    p.style.fontSize = `${scale}rem`;
                    container.appendChild(p);
                }
            });
        </script>
    </form>
</body>
</html>




