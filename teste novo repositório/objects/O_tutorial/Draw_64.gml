// ==========================================
// POSIÇÃO E TAMANHO DO QUADRO
// ==========================================

var largura = 1300;
var altura = 700;

var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

var esquerda = cx - largura / 2;
var cima = cy - altura / 2;
var direita = cx + largura / 2;
var baixo = cy + altura / 2;

// ==========================================
// PERGAMINHO DE MENSAGEM
// ==========================================

draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_stretched(
    S_mensagem,
    0,
    esquerda,
    cima,
    largura,
    altura
);
    // ==========================================
    // TEXTO
    // ==========================================

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);


    if (mensagem == 0)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Bem-vindo a A Ultima Profecia.\nUma nova jornada comeca agora...",
            1.5,
            1.5,
            0
        );
    }


    if (mensagem == 1)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Use W, A, S e D para se movimentar.\nExplore o ambiente e descubra o que este lugar esconde.",
            1.5,
            1.5,
            0
        );
    }


    if (mensagem == 2)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Use as setas direcionais para realizar um DASH.\nEle permite que você avance rapidamente e escape de situações perigosas.",
            1.5,
            1.5,
            0
        );
    }


    if (mensagem == 3)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Seus DASHs possuem cargas limitadas.\nUse-os com sabedoria, pois eles se recuperam com o tempo.",
            1.5,
            1.5,
            0
        );
    }


    if (mensagem == 4)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Seu primeiro objetivo é encontrar 10 pergaminhos e coletar 15 madeiras espalhados pela Fortaleza de Kojin.\nMas alguns deles podem estar dificeis de encontrar...",
            1.5,
            1.5,
            0
        );
    }


    if (mensagem == 5)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Aquele brilho indica a localização de um objeto importante.\Aproxime-se dos pergaminhos e das madeiras e pressione E para coletá-los.",
            1.5,
            1.5,
            0
        );
    }


    if (mensagem == 6)
    {
        draw_text_transformed(
            cx,
            cima + 350,
            "Muito bem!\nAgora explore a Fortaleza de Kojin e descubra os segredos que ela esconde.",
            1.5,
            1.5,
            0
        );
    }


    // ==========================================
    // CONTINUAR
    // ==========================================

    draw_set_color(make_color_rgb(240, 200, 90));

    draw_text_transformed(
        direita - 120,
        baixo - 45,
        "[ E ] CONTINUAR",
        1.3,
        1.3,
        0
    );



// ==========================================
// RESET
// ==========================================

draw_set_alpha(1);
draw_set_color(c_black);