// ==========================================
// MOVIMENTO ALEATÓRIO
// ==========================================

tempo_movimento--;

if (tempo_movimento <= 0)
{
    direcao = irandom(359);
    velocidade = random_range(0.5, 1.2);
    tempo_movimento = irandom_range(30, 90);
}

var mov_x = lengthdir_x(velocidade, direcao);

if (!place_meeting(x + mov_x, y, O_parede))
{
    x += mov_x;
}
else
{
    direcao = irandom(359);
}

var mov_y = lengthdir_y(velocidade, direcao);

if (!place_meeting(x, y + mov_y, O_parede))
{
    y += mov_y;
}
else
{
    direcao = irandom(359);
}


// ==========================================
// DISTÂNCIA DO JOGADOR
// ==========================================

var distancia = point_distance(x, y, O_pai.x, O_pai.y);


// ==========================================
// COLETAR
// ==========================================

if (distancia < 60)
{
    if (keyboard_check_pressed(ord("E")))
    {
        if (verdadeiro)
        {
            global.livro_encontrado = true;
            global.livro_coletado = true;

            global.livro_tempo = room_speed * 2;

            mensagem = "Livro verdadeiro!";
            tempo_mensagem = room_speed * 2;
        }
        else
        {
            mensagem = "Livro falso!";
            tempo_mensagem = room_speed * 2;
        }
    }
}

// ==========================================
// CONTADOR PARA DESTRUIR OS LIVROS
// ==========================================

if (global.livro_encontrado)
{
    global.livro_tempo--;

    if (global.livro_tempo <= 0)
    {
        with (O_livro)
        {
            instance_destroy();
        }
    }
}
// ==========================================
// TEMPO DA MENSAGEM
// ==========================================

if (tempo_mensagem > 0)
{
    tempo_mensagem--;
}


// ==========================================
// TEMPO PARA DESTRUIR OS LIVROS
// ==========================================

if (global.livro_encontrado)
{
    global.livro_tempo--;

    if (global.livro_tempo <= 0)
    {
        with (O_livro)
        {
            instance_destroy();
        }
    }
}