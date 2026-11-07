if (keyboard_check_pressed(vk_up)) {
    botao_selecionado--;
}

if (keyboard_check_pressed(vk_down)) {
    botao_selecionado++;
}

if (botao_selecionado < 0) {
    botao_selecionado = 3;
}

if (botao_selecionado > 3) {
    botao_selecionado = 0;
}

if (keyboard_check_pressed(vk_enter)) {
    switch (botao_selecionado) {
        case 0:
            room_goto(RM_selecaodepersonagem);
            break;

        case 1:
            show_debug_message("PERSONAGENS");
            break;

        case 2:
            show_debug_message("CONFIGURAÇÕES");
            break;

        case 3:
            game_end();
            break;
    }
}