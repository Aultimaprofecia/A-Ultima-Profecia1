
if (array_contains(global.madeiras_chaves_coletadas, chave_madeira))
{
    instance_destroy();
    exit;
}

var jogador = instance_find(O_pai, 0);

if (instance_exists(jogador))
{
    var distancia = point_distance(x, y, jogador.x, jogador.y);

    perto = distancia < 40;

    if (perto && keyboard_check_pressed(ord("E")))
    {
        if (!array_contains(global.madeiras_chaves_coletadas, chave_madeira))
        {
            array_push(global.madeiras_chaves_coletadas, chave_madeira);
            global.madeiras_coletadas += 1;
        }

        instance_destroy();
    }
}
