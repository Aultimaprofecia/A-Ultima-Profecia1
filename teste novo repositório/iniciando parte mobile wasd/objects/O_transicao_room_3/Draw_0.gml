draw_self();

if (perto && !mensagem_aberta)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_black);

    draw_roundrect(
        x - 60,
        y - 45,
        x + 60,
        y - 5,
        false
    );

    draw_set_color(c_white);

    draw_text(
        x,
        y - 25,
        "[E] Entrar"
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}