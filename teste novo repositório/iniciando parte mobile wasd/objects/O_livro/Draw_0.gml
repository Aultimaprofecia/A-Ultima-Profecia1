draw_self();

var distancia = point_distance(x, y, O_pai.x, O_pai.y);

if (distancia < 60)
{
    draw_set_color(c_white);

    draw_text(
        x - 30,
        y - 40,
        "[E] Coletar"
    );
}
draw_self();

var distancia = point_distance(x, y, O_pai.x, O_pai.y);

if (distancia < 60)
{
    draw_set_color(c_white);
    draw_text(x - 30, y - 40, "[E] Coletar");
}

if (tempo_mensagem > 0)
{
    draw_set_color(c_white);
    draw_text(x - 40, y - 70, mensagem);
}