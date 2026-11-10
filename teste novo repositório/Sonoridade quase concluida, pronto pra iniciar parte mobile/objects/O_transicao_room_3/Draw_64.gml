if (mensagem_aberta)
{
    var centro_x = display_get_gui_width() / 2;
    var centro_y = display_get_gui_height() / 2;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
// PERGAMINHO
draw_set_color(c_black);
draw_set_alpha(1);

draw_sprite_stretched(
    S_mensagem,
    0,
    centro_x - 350,
    centro_y - 150,
    700,
    300
);

    // TÍTULO
    draw_set_color(c_black);

    draw_text_transformed(
        centro_x,
        centro_y - 70,
        "PORTA TRANCADA",
        1.5,
        1.5,
        0
    );

    // MENSAGEM
    draw_text(
        centro_x,
        centro_y,
        mensagem
    );

    // FECHAR
    draw_text(
        centro_x,
        centro_y + 70,
        "[X] Fechar"
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}