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
        if (keyboard_check_pressed(ord("E")))
        {
            var mais_proximo = instance_nearest(
                O_pai.x,
                O_pai.y,
                O_transicao_room_3
            );

            if (mais_proximo == id)
            {
                if (global.livro_coletado)
                {
                    array_push(global.historico_rooms, room);
                    room_goto(RM_guardas1fase);
                }
                else
                {
                    mensagem = "Voce precisa encontrar o livro verdadeiro.";
                    mensagem_aberta = true;
                }
            }
        }
    }
}