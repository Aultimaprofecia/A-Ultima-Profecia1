// ==========================================
// TELA PRETA
// ==========================================

if (escurecer > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(escurecer);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);
}


// ==========================================
// FIM DO TUTORIAL + LOGO
// ==========================================

if (texto_alpha > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_alpha(texto_alpha);

    // LOGO
    draw_sprite_ext(
        S_logo,
        0,
        display_get_gui_width() / 2,
        display_get_gui_height() / 2 - 100,
        0.6,
        0.6,
        0,
        c_white,
        texto_alpha
    );

    // TEXTO
    draw_set_color(c_white);

    draw_text_transformed(
        display_get_gui_width() / 2,
        display_get_gui_height() / 2 + 100,
        "FIM DO TUTORIAL",
        2.5,
        2.5,
        0
    );

    draw_set_alpha(1);
}


// ==========================================
// AGRADECIMENTO
// ==========================================

if (agradecimento_alpha > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);
    draw_set_alpha(agradecimento_alpha);

    draw_text(
        display_get_gui_width() / 2,
        agradecimento_y - 70,
        "Caro jogador,"
    );

    draw_text(
        display_get_gui_width() / 2,
        agradecimento_y - 35,
        "agradecemos por estar aqui e fazer parte desta jornada."
    );

    draw_text(
        display_get_gui_width() / 2,
        agradecimento_y,
        "Esperamos que A Ultima Profecia te traga"
    );

    draw_text(
        display_get_gui_width() / 2,
        agradecimento_y + 35,
        "curiosidade, coragem e vontade de descobrir o que vem a seguir."
    );

    draw_text(
        display_get_gui_width() / 2,
        agradecimento_y + 85,
        "A profecia apenas comecou..."
    );

    draw_set_alpha(1);
}


// ==========================================
// BOTÃO VOLTAR AO MENU
// ==========================================

if (botao_alpha > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_alpha(botao_alpha);

    // BOTÃO
    draw_set_color(c_black);

    draw_roundrect(
        botao_x - botao_largura / 2,
        botao_y - botao_altura / 2,
        botao_x + botao_largura / 2,
        botao_y + botao_altura / 2,
        false
    );

    // TEXTO DO BOTÃO
    draw_set_color(c_white);

    draw_text(
        botao_x,
        botao_y,
        "Voltar ao Menu"
    );

    draw_set_alpha(1);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}