var distancia = point_distance(x, y, O_pai.x, O_pai.y);

perto = distancia < 40;


// ==========================================
// FECHAR MENSAGEM
// ==========================================

if (mensagem_aberta)
{
    if (keyboard_check_pressed(ord("X")))
    {
        mensagem_aberta = false;
        mensagem = "";
    }
}
else
{
    // ======================================
    // INTERAÇÃO COM A PORTA
    // ======================================

    if (perto)
    {
        // ENTRAR
        if (keyboard_check_pressed(ord("E")))
        {
            var mais_proximo = instance_nearest(
                O_pai.x,
                O_pai.y,
                O_transicao_room_2
            );

            if (mais_proximo == id)
            {
                if (global.chave_coletada)
                {
                    array_push(global.historico_rooms, room);
                    room_goto(RM_SaladeEnergia);
                }
                else
                {
                    mensagem = "Voce precisa encontrar a chave.";
                    mensagem_aberta = true;
                }
            }
        }


        // VOLTAR
        if (keyboard_check_pressed(ord("V")))
        {
            var tamanho = array_length(global.historico_rooms);

            if (tamanho > 0)
            {
                var room_voltar = global.historico_rooms[tamanho - 1];

                array_resize(
                    global.historico_rooms,
                    tamanho - 1
                );

                room_goto(room_voltar);
            }
        }
    }
}