// ==========================================
// TUTORIAL DE PERSEGUICAO
// ==========================================

if (modo_perseguicao)
{
    if (!jogo_congelado)
    {
        global.jogo_pausado = true;
        jogo_congelado = true;
    }

    if (keyboard_check_pressed(ord("E")))
    {
        global.jogo_pausado = false;
        instance_destroy();
    }

    exit;
}


// ==========================================
// TUTORIAL INICIAL ORIGINAL
// ==========================================

if (keyboard_check_pressed(ord("E")))
{
    mensagem++;

    if (mensagem > 6)
    {
        instance_destroy();
    }
}