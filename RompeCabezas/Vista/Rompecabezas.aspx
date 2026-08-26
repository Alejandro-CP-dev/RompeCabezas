<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rompecabezas.aspx.cs" Inherits="RompeCabezas.Vista.Rompecabezas" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Arma el cuadro</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,500..900;1,500..900&amp;family=EB+Garamond:ital,wght@0,400..800;1,400..800&amp;family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        "surface": "#170e0d",
                        "surface-container": "#241513",
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
                radial-gradient(circle at 50% 0%, rgba(138,28,38,0.15) 0%, transparent 55%),
                radial-gradient(circle at 50% 100%, rgba(0,0,0,0.6) 0%, transparent 70%),
                url("data:image/svg+xml,%3Csvg width='140' height='140' viewBox='0 0 140 140' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' stroke='%23af8c4f' stroke-width='0.4' opacity='0.08'%3E%3Ccircle cx='70' cy='70' r='60'/%3E%3Ccircle cx='70' cy='70' r='40'/%3E%3C/g%3E%3C/svg%3E");
        }

        /* El tablero se ve como un cuadro colgado: marco dorado grueso sobre pared oscura */
        .cuadro-marco {
            position: relative;
            background: linear-gradient(180deg, #b89a5c 0%, #8a6c37 50%, #b89a5c 100%);
            padding: 14px;
            border-radius: 4px;
            box-shadow:
                0 0 0 2px #5c4620,
                0 25px 60px rgba(0,0,0,0.6),
                inset 0 0 20px rgba(0,0,0,0.4);
        }

        .cuadro-lienzo {
            position: relative;
            background: #2b1719;
            border: 1px solid #5c4620;
        }

        .tablero {
            position: relative;
            background: #241513;
        }

        .casilla {
            position: absolute;
            border: 1px dashed rgba(175,140,79,0.35);
            box-sizing: border-box;
        }

        .pieza {
            display: inline-block;
            cursor: grab;
            border: 2px solid #af8c4f;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.5);
            box-sizing: border-box;
            transition: transform 0.15s ease;
        }

        .pieza:hover {
            transform: scale(1.04);
        }

        .pieza.colocada {
            border: none;
            box-shadow: none;
            cursor: default;
        }

        .contenedor-piezas {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            justify-content: center;
        }

        @keyframes brillo {
            0%, 100% { opacity: 0.5; text-shadow: 0 0 4px rgba(175,140,79,0.4); }
            50% { opacity: 1; text-shadow: 0 0 12px rgba(175,140,79,0.8); }
        }

        .vela {
            animation: brillo 2.4s ease-in-out infinite;
        }
    </style>
</head>
<body class="min-h-screen font-body text-on-surface flex flex-col items-center justify-center p-6">
    <form id="form1" runat="server">
        <main class="w-full max-w-[520px] mx-auto flex flex-col items-center text-center gap-6">

            <div class="flex flex-col gap-2 items-center">
                <span class="vela text-gold text-2xl">✦</span>
                <h1 class="font-display text-4xl text-on-surface tracking-wide">Arma el cuadro</h1>
                <p class="text-on-surface-variant font-headline italic text-lg max-w-[380px]">
                    Cada pieza que coloques revive un instante nuestro. Cuando el retrato esté completo, algo te espera.
                </p>
            </div>

            <div class="cuadro-marco w-full">
                <div class="cuadro-lienzo p-4 flex flex-col items-center gap-4">
                    <div id="tablero" class="tablero"></div>
                    <div id="piezas" class="contenedor-piezas"></div>
                </div>
            </div>

            <asp:HiddenField ID="hdnCompletado" runat="server" ClientIDMode="Static" Value="false" />
            <asp:HiddenField ID="hdnTiempo" runat="server" ClientIDMode="Static" Value="0" />
            <asp:Button ID="btnCompletado" runat="server" Text="" style="display:none;"
                OnClick="btnCompletado_Click" ClientIDMode="Static" />

        </main>

        <script src="../Scripts/rompecabezas.js"></script>
    </form>
</body>
</html>

