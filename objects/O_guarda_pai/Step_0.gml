

// =====================================================
// GUARDA - SISTEMA COMPLETO
// =====================================================


// =====================================================
// 1. PATRULHA
// =====================================================

if (estado == 0)
{
    var mov_patrol = vel * direcao;

    // Verifica parede antes de andar
    if (!place_meeting(x + mov_patrol, y, O_parede))
    {
        x += mov_patrol;
    }
    else
    {
        // Bateu na parede -> vira
        direcao *= -1;
    }
}


// =====================================================
// 2. DETECÇÃO DO JOGADOR
// =====================================================

if (estado == 0)
{
    if (instance_exists(O_pai))
    {
        var distancia = point_distance(
            x,
            y,
            O_pai.x,
            O_pai.y
        );

        if (distancia <= distancia_visao)
        {
            var direcao_jogador = point_direction(
                x,
                y,
                O_pai.x,
                O_pai.y
            );

            // Só detecta quem estiver na frente
            if (abs(angle_difference(direcao * 180, direcao_jogador)) <= 45)
            {
                estado = 1;
            }
        }
    }
}


// =====================================================
// 3. PERSEGUIÇÃO
// =====================================================

// =====================================================
// 3. PERSEGUIÇÃO
// =====================================================

if (estado == 1)
{
    if (instance_exists(O_pai))
	       

     var distancia = point_distance(
    x,
    y,
    O_pai.x,
    O_pai.y
);

var direcao_jogador = point_direction(
    x,
    y,
    O_pai.x,
    O_pai.y
);

var jogador_visivel = false;

if (distancia <= distancia_visao)
{
    if (abs(angle_difference(direcao * 180, direcao_jogador)) <= 45)
    {
        jogador_visivel = true;
    }
}

// Só perde o jogador quando ele estiver
// realmente longe do alcance do guarda
if (distancia > distancia_visao)
{
    ultimo_x = O_pai.x;
    ultimo_y = O_pai.y;

    tempo_procurando = tempo_max_procurando;
    estado = 2;
}

        var velocidade_perseguicao = vel * 1.5;

        var mov_x = lengthdir_x(
            velocidade_perseguicao,
            direcao_jogador
        );

        var mov_y = lengthdir_y(
            velocidade_perseguicao,
            direcao_jogador
        );


        // =============================================
        // TENTA IR DIRETO PARA O JOGADOR
        // =============================================

        if (!place_meeting(x + mov_x, y + mov_y, O_parede))
        {
            x += mov_x;
            y += mov_y;
        }


        // =============================================
        // SE BATEU, TENTA IR PELO HORIZONTAL
        // =============================================

        else if (!place_meeting(x + mov_x, y, O_parede))
        {
            x += mov_x;
        }


        // =============================================
        // SE NÃO DEU, TENTA IR PELO VERTICAL
        // =============================================

        else if (!place_meeting(x, y + mov_y, O_parede))
        {
            y += mov_y;
        }
		


        // =============================================
        // SE AINDA ESTIVER PRESO,
        // TENTA UM MOVIMENTO LATERAL
        // =============================================

        else
        {
            var tentativa_lateral = 3;

            // Tenta para a direita
            if (!place_meeting(x + tentativa_lateral, y, O_parede))
            {
                x += tentativa_lateral;
            }

            // Tenta para a esquerda
            else if (!place_meeting(x - tentativa_lateral, y, O_parede))
            {
                x -= tentativa_lateral;
            }

            // Tenta para baixo
            else if (!place_meeting(x, y + tentativa_lateral, O_parede))
            {
                y += tentativa_lateral;
            }

            // Tenta para cima
            else if (!place_meeting(x, y - tentativa_lateral, O_parede))
            {
                y -= tentativa_lateral;
            }
        }
    }

// =====================================================
// 4. PROCURANDO O JOGADOR
// =====================================================

if (estado == 2)
// =====================================================
// 4. PROCURANDO O JOGADOR
// =====================================================

if (estado == 2)
{
    tempo_procurando--;

    // Vai até o último local onde viu o jogador
    var distancia_ultimo_ponto = point_distance(
        x,
        y,
        ultimo_x,
        ultimo_y
    );

    if (distancia_ultimo_ponto > 5)
    {
        var direcao_ultimo_ponto = point_direction(
            x,
            y,
            ultimo_x,
            ultimo_y
        );

        var velocidade_procura = vel;

        var mov_x = lengthdir_x(
            velocidade_procura,
            direcao_ultimo_ponto
        );

        var mov_y = lengthdir_y(
            velocidade_procura,
            direcao_ultimo_ponto
        );

        if (!place_meeting(x + mov_x, y + mov_y, O_parede))
        {
            x += mov_x;
            y += mov_y;
        }
    }

    // Só volta para a patrulha quando o tempo acabar
    if (tempo_procurando <= 0)
    {
        estado = 0;
    }
}