

// ==========================
// HUD DE VIDAS
// ==========================

var tamanho = 0.25;

// Posição no canto superior direito
var pos_x = display_get_gui_width() - 150;
var pos_y = 50;


// 3 VIDAS
if (vidas == 3)
{
    draw_sprite_ext(
        S_vida_cheia,
        0,
        pos_x,
        pos_y,
        tamanho,
        tamanho,
        0,
        c_white,
        1
    );
}


// 2 VIDAS
else if (vidas == 2)
{
    draw_sprite_ext(
        S_vida_vazia1,
        0,
        pos_x,
        pos_y,
        tamanho,
        tamanho,
        0,
        c_white,
        1
    );
}


// 1 VIDA
else if (vidas == 1)
{
    draw_sprite_ext(
        S_vida_vazia2,
        0,
        pos_x,
        pos_y,
        tamanho,
        tamanho,
        0,
        c_white,
        1
    );
}


// 0 VIDAS
else
{
    draw_sprite_ext(
        S_vida_vazia3,
        0,
        pos_x,
        pos_y,
        tamanho,
        tamanho,
        0,
        c_white,
        1
    );
}
// ==========================================
// TELA DE MORTE
// ==========================================

var jogador = instance_find(O_pai, 0);

if (instance_exists(jogador) && jogador.morto)
{
       // SOM DE MORTE - TOCA APENAS UMA VEZ
  if (!variable_instance_exists(jogador, "som_morte_tocado"))
{
    jogador.som_morte_tocado = false;
}

if (!jogador.som_morte_tocado)
{
    audio_play_sound(Som_jumpscare, 1, false);
    jogador.som_morte_tocado = true;
}
   
   var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    // Fundo escuro
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);

    // Título
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(gw / 2, gh / 2 - 70, "VOCE MORREU");

    // Botão Reviver
    var bx1 = gw / 2 - 110;
    var bx2 = gw / 2 + 110;
    var by1 = gh / 2 + 25;
    var by2 = gh / 2 + 95;

    draw_set_color(make_color_rgb(100, 55, 35));
    draw_rectangle(bx1, by1, bx2, by2, false);

    draw_set_color(c_yellow);
    draw_rectangle(bx1, by1, bx2, by2, true);

    draw_set_color(c_white);
    draw_text(gw / 2, (by1 + by2) / 2, "REVIVER");

    // Restaurar alinhamentos
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	

}
  