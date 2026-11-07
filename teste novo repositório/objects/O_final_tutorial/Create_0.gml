// ==========================================
// CONTROLE DO FINAL
// ==========================================

tempo = room_speed * 4;

// 0 = esperando
// 1 = escurecendo
// 2 = mostrando fim do tutorial
// 3 = sumindo fim do tutorial
// 4 = mostrando agradecimento
// 5 = botão
estado = 0;


// ==========================================
// ESCURECIMENTO
// ==========================================

escurecer = 0;


// ==========================================
// FIM DO TUTORIAL
// ==========================================

texto_alpha = 0;


// ==========================================
// AGRADECIMENTO
// ==========================================

agradecimento_alpha = 0;
agradecimento_y = 0;


// ==========================================
// BOTÃO
// ==========================================

botao_alpha = 0;

botao_x = display_get_gui_width() / 2;
botao_y = display_get_gui_height() / 2 + 220;

botao_largura = 240;
botao_altura = 60;