// ==========================
// HUD DE DASH
// ==========================

var tamanho = 0.25;

// Posição no canto superior direito
var pos_x = display_get_gui_width() - 160;
var pos_y = 150;


// ==========================
// 3 CARGAS
// ==========================

if (dash_cargas == 3)
{
    draw_sprite_ext(
        S_dash_cheio,
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


// ==========================
// 2 CARGAS
// ==========================

else if (dash_cargas == 2)
{
    draw_sprite_ext(
        S_dash_vazio1,
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


// ==========================
// 1 CARGA
// ==========================

else if (dash_cargas == 1)
{
    draw_sprite_ext(
        S_dash_vazio2,
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


// ==========================
// 0 CARGAS
// ==========================

else
{
    draw_sprite_ext(
        S_dash_vazio3,
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