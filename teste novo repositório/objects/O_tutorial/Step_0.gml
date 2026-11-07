if (keyboard_check_pressed(ord("E")))
{
    mensagem++;

    if (mensagem > 6)
    {
        instance_destroy();
    }
}