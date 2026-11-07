draw_self();

if (perto)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_black);
    draw_roundrect(
        x - 45,
        y - 55,
        x + 45,
        y - 25,
        false
    );

    draw_set_color(c_white);
    draw_text(x, y - 40, "[E] Coletar");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


