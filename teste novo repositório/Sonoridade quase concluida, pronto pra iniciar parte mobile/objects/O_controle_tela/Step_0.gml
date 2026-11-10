if (keyboard_check_pressed(vk_escape))
{
    global.tela_cheia = !global.tela_cheia;
    window_set_fullscreen(global.tela_cheia);
}