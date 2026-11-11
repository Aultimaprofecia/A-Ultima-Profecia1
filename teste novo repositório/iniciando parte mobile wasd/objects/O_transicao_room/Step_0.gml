var distancia = point_distance(x, y, O_pai.x, O_pai.y);

perto = distancia < 40;

if (perto)
{
    // ENTRAR
    if (keyboard_check_pressed(ord("E")))
    {
        var mais_proximo = instance_nearest(O_pai.x, O_pai.y, O_transicao_room);

        if (mais_proximo == id)
        {
            array_push(global.historico_rooms, room);
            room_goto_next();
        }
    }

    // VOLTAR
    if (keyboard_check_pressed(ord("V")))
    {
        var tamanho = array_length(global.historico_rooms);

        if (tamanho > 0)
        {
            var room_voltar = global.historico_rooms[tamanho - 1];

            array_resize(global.historico_rooms, tamanho - 1);

            room_goto(room_voltar);
        }
    }
}