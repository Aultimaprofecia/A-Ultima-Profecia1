
// =====================================
// EFEITO DE PERIGO - PERSEGUICAO
// =====================================

if (guardas_perseguindo > 0)
{
    var largura = display_get_gui_width();
    var altura = display_get_gui_height();

    // Pulsacao do vermelho
    var pulso = (sin(current_time / 180) + 1) / 2;

    // Intensidade da transparencia
    var alpha_base = 0.08 + pulso * 0.13;

    // Camadas para criar uma borda suave
    var camadas = 8;
    var espessura = 45;

    draw_set_color(c_red);

    for (var i = 0; i < camadas; i++)
    {
        var distancia = i * espessura;
        var alpha = alpha_base * (1 - i / camadas);

        draw_set_alpha(alpha);

        // Borda superior
        draw_rectangle(
            0, distancia,
            largura, distancia + espessura,
            false
        );

        // Borda inferior
        draw_rectangle(
            0, altura - distancia - espessura,
            largura, altura - distancia,
            false
        );

        // Borda esquerda
        draw_rectangle(
            distancia, 0,
            distancia + espessura, altura,
            false
        );

        // Borda direita
        draw_rectangle(
            largura - distancia - espessura, 0,
            largura - distancia, altura,
            false
        );
    }

    // Restaurar transparencia
    draw_set_alpha(1);
    draw_set_color(c_white);
}
