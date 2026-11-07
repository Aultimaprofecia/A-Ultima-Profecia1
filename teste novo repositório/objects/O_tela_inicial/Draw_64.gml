// Fundo
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Título
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(-1);
draw_text(683, 180, "A ULTIMA PROFECIA");

draw_set_color(c_white);

draw_text(683, 320, "JOGAR");
draw_text(683, 390, "PERSONAGENS");
draw_text(683, 460, "CONFIGURAÇÕES");
draw_text(683, 530, "SAIR");