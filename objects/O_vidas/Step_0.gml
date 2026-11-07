
var jogador = instance_find(O_pai, 0);

if (instance_exists(jogador) && jogador.morto)
{
    if (mouse_check_button_pressed(mb_left))
    {
        var gw = display_get_gui_width();
        var gh = display_get_gui_height();

        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        var bx1 = gw / 2 - 110;
        var bx2 = gw / 2 + 110;
        var by1 = gh / 2 + 25;
        var by2 = gh / 2 + 95;

 // ==========================================
// DEVOLVER PERGAMINHOS DA SALA ATUAL
// ==========================================

if (variable_global_exists("pergaminhos_coletados"))
{
    var prefixo = string(room) + "_";

    for (var i = array_length(global.pergaminhos_coletados) - 1; i >= 0; i--)
    {
        var id_item = global.pergaminhos_coletados[i];

        if (string_copy(id_item, 1, string_length(prefixo)) == prefixo)
        {
            array_delete(global.pergaminhos_coletados, i, 1);

            global.pergaminhos = max(0, global.pergaminhos - 1);
        }
    }
}

 // ==========================================
// DEVOLVER MADEIRAS DA SALA ATUAL
// ==========================================

if (variable_global_exists("madeiras_chaves_coletadas"))
{
    var prefixo_madeira = string(room) + "_";

    for (var j = array_length(global.madeiras_chaves_coletadas) - 1; j >= 0; j--)
    {
        var id_madeira = global.madeiras_chaves_coletadas[j];

        if (string_copy(id_madeira, 1, string_length(prefixo_madeira)) == prefixo_madeira)
        {
            array_delete(global.madeiras_chaves_coletadas, j, 1);

            global.madeiras_coletadas = max(0, global.madeiras_coletadas - 1);
        }
    }
}
if (variable_global_exists("chave_room") && global.chave_room == room)
{
    global.chave_coletada = false;
}
        if (mx >= bx1 && mx <= bx2 &&
            my >= by1 && my <= by2)
        {
            room_restart();
        }
    }
}
