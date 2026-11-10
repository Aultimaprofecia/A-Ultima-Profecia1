var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// JOGAR
if (mx > 580 && mx < 790 && my > 290 && my < 350)
{
    room_goto(RM_selecaodepersonagem);
}

// PERSONAGENS
else if (mx > 580 && mx < 790 && my > 360 && my < 420)
{
    show_debug_message("Personagens");
}

// CONFIGURAÇÕES
else if (mx > 580 && mx < 790 && my > 430 && my < 490)
{
    show_debug_message("Configurações");
}

// SAIR
else if (mx > 580 && mx < 790 && my > 500 && my < 560)
{
    game_end();
}