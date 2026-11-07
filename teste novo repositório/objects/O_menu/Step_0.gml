// ================================
// TELA INICIAL
// ================================

if (room == RM_pag_inicial)
{
    if (keyboard_check_pressed(vk_enter))
    {
        room_goto(RM_menu_principal);
    }

    if (mouse_check_button_pressed(mb_left))
    {
        room_goto(RM_menu_principal);
    }
}


// ================================
// MENU PRINCIPAL
// ================================

if (room == RM_menu_principal)
{
    if (keyboard_check_pressed(vk_down))
    {
        selecionado++;

        if (selecionado > 3)
        {
            selecionado = 0;
        }
    }

    if (keyboard_check_pressed(vk_up))
    {
        selecionado--;

        if (selecionado < 0)
        {
            selecionado = 3;
        }
    }

    if (keyboard_check_pressed(vk_enter))
    {
        switch (selecionado)
        {
            case 0:
                room_goto(RM_escolhadepersonagem);
            break;

            case 1:
                // Configurações
            break;

            case 2:
                // Créditos
            break;

            case 3:
                game_end();
            break;
        }
    }
}


// ================================
// ESCOLHA DE PERSONAGEM
// ================================

if (room == RM_escolhadepersonagem)
{
    if (keyboard_check_pressed(vk_right))
    {
        selecionado++;

        if (selecionado > 2)
        {
            selecionado = 0;
        }
    }

    if (keyboard_check_pressed(vk_left))
    {
        selecionado--;

        if (selecionado < 0)
        {
            selecionado = 2;
        }
    }

    if (keyboard_check_pressed(vk_enter))
    {
        switch (selecionado)
        {
            case 0:
                global.personagem = 0;
            break;

            case 1:
                global.personagem = 1;
            break;

            case 2:
                global.personagem = 2;
            break;
        }

        room_goto(RM_quarto);
    }
}