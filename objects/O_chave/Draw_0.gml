draw_self();

var distancia = point_distance(x, y, O_pai.x, O_pai.y);

if (distancia < 60)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);

    draw_text(
        x,
        y - 40,
        "[E] Coletar"
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}