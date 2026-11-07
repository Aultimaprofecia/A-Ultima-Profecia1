// ==========================================
// ESPERAR 4 SEGUNDOS
// ==========================================

if (estado == 0)
{
    tempo--;

    if (tempo <= 0)
    {
        estado = 1;
    }
}


// ==========================================
// ESCURECER
// ==========================================

if (estado == 1)
{
    escurecer += 0.005;

    if (escurecer >= 1)
    {
        escurecer = 1;
        estado = 2;
    }
}


// ==========================================
// FIM DO TUTORIAL APARECE
// ==========================================

if (estado == 2)
{
    texto_alpha += 0.02;

    if (texto_alpha >= 1)
    {
        texto_alpha = 1;

        // espera alguns segundos
        tempo = room_speed * 3;
        estado = 3;
    }
}


// ==========================================
// FIM DO TUTORIAL SOME
// ==========================================

if (estado == 3)
{
    tempo--;

    if (tempo <= 0)
    {
        texto_alpha -= 0.02;

        if (texto_alpha <= 0)
        {
            texto_alpha = 0;

            agradecimento_y = display_get_gui_height() / 2 + 100;

            estado = 4;
        }
    }
}


// ==========================================
// AGRADECIMENTO SOBE E APARECE
// ==========================================

if (estado == 4)
{
    agradecimento_alpha += 0.02;

    agradecimento_y -= 0.5;

    if (agradecimento_alpha >= 1)
    {
        agradecimento_alpha = 1;
    }

    if (agradecimento_y <= display_get_gui_height() / 2)
    {
        agradecimento_y = display_get_gui_height() / 2;

        tempo = room_speed * 2;
        estado = 5;
    }
}


// ==========================================
// BOTÃO APARECE
// ==========================================

if (estado == 5)
{
    tempo--;

    if (tempo <= 0)
    {
        botao_alpha += 0.03;

        if (botao_alpha >= 1)
        {
            botao_alpha = 1;
        }
    }


    // ======================================
    // CLIQUE NO BOTÃO
    // ======================================

    var mouse_x_gui = device_mouse_x_to_gui(0);
    var mouse_y_gui = device_mouse_y_to_gui(0);

    if (botao_alpha >= 1)
    {
        if (
            mouse_x_gui > botao_x - botao_largura / 2 &&
            mouse_x_gui < botao_x + botao_largura / 2 &&
            mouse_y_gui > botao_y - botao_altura / 2 &&
            mouse_y_gui < botao_y + botao_altura / 2
        )
        {
            if (mouse_check_button_pressed(mb_left))
            {
                room_goto(RM_inicial);
            }
        }
    }
}