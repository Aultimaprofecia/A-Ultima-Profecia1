if (mensagem == 5)
{
    if (instance_exists(O_pergaminho))
    {
        var perg = instance_find(O_pergaminho, 0);

        var pulso = (sin(current_time / 150) + 1) / 2;

        draw_set_alpha(0.25 + pulso * 0.25);
        draw_set_color(make_color_rgb(255, 210, 70));

        draw_circle(
            perg.x,
            perg.y,
            35 + pulso * 15,
            false
        );

        draw_set_alpha(0.15 + pulso * 0.15);

        draw_circle(
            perg.x,
            perg.y,
            55 + pulso * 20,
            false
        );

        draw_set_alpha(1);
        draw_set_color(c_white);
    }
}