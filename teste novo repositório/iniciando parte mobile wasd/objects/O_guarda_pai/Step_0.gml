if (variable_global_exists("jogo_pausado") && global.jogo_pausado)
{
    exit;
}
// =====================================================
// GUARDA - MOVIMENTAÇÃO E ANIMAÇÃO
// =====================================================

// VARIÁVEIS DE MOVIMENTO
var mov_x = 0;
var mov_y = 0;

// =====================================================
// 1. PATRULHA
// =====================================================

if (estado == 0)
{
    var mov_patrol = vel * direcao;

    if (!place_meeting(x + mov_patrol, y, O_parede))
    {
        x += mov_patrol;
        mov_x = mov_patrol;
    }
    else
    {
        direcao *= -1;
    }
}

// =====================================================
// 2. DETECÇÃO DO JOGADOR
// =====================================================

if (estado == 0 && instance_exists(O_pai))
{
    var distancia = point_distance(x, y, O_pai.x, O_pai.y);

    if (distancia <= distancia_visao)
    {
        var dir_jogador = point_direction(x, y, O_pai.x, O_pai.y);

        if (abs(angle_difference(direcao * 180, dir_jogador)) <= 45)
        {
            estado = 1;

            // ==========================================
            // TUTORIAL DA PRIMEIRA PERSEGUICAO
            // ==========================================

            if (!variable_global_exists("tutorial_perseguicao_visto"))
            {
                global.tutorial_perseguicao_visto = false;
            }

            if (!global.tutorial_perseguicao_visto)
            {
                global.tutorial_perseguicao_visto = true;

                var aviso = instance_create_depth(
                    0, 0, 0, O_tutorial
                );

                aviso.modo_perseguicao = true;
            }

            // SOM DE ALERTA
            if (!som_hey_tocado)
            {
                audio_play_sound(Som_hey, 1, false);
                som_hey_tocado = true;
            }
        }
    }
}

// =====================================================
// 3. PERSEGUIÇÃO
// =====================================================

if (estado == 1)
{
    if (instance_exists(O_pai))
    {
        var distancia = point_distance(x, y, O_pai.x, O_pai.y);

        var dir_jogador = point_direction(x, y, O_pai.x, O_pai.y);

        if (distancia > distancia_visao)
        {
            ultimo_x = O_pai.x;
            ultimo_y = O_pai.y;

            tempo_procurando = tempo_max_procurando;
            estado = 2;
        }
        else
        {
            var velocidade_perseguicao = vel * 1.5;

            var mx = lengthdir_x(velocidade_perseguicao, dir_jogador);
            var my = lengthdir_y(velocidade_perseguicao, dir_jogador);

            if (!place_meeting(x + mx, y + my, O_parede))
            {
                x += mx;
                y += my;

                mov_x = mx;
                mov_y = my;
            }
            else if (!place_meeting(x + mx, y, O_parede))
            {
                x += mx;
                mov_x = mx;
            }
            else if (!place_meeting(x, y + my, O_parede))
            {
                y += my;
                mov_y = my;
            }
            else
            {
                var tentativa = 3;

                if (!place_meeting(x + tentativa, y, O_parede))
                {
                    x += tentativa;
                    mov_x = tentativa;
                }
                else if (!place_meeting(x - tentativa, y, O_parede))
                {
                    x -= tentativa;
                    mov_x = -tentativa;
                }
                else if (!place_meeting(x, y + tentativa, O_parede))
                {
                    y += tentativa;
                    mov_y = tentativa;
                }
                else if (!place_meeting(x, y - tentativa, O_parede))
                {
                    y -= tentativa;
                    mov_y = -tentativa;
                }
            }
        }
    }
}


// =====================================================
// 4. PROCURANDO O JOGADOR
// =====================================================

if (estado == 2)
{
    tempo_procurando--;

    var distancia_ultimo = point_distance(
        x, y,
        ultimo_x, ultimo_y
    );

    if (distancia_ultimo > 5)
    {
        var dir_ultimo = point_direction(
            x, y,
            ultimo_x, ultimo_y
        );

        var mx = lengthdir_x(vel, dir_ultimo);
        var my = lengthdir_y(vel, dir_ultimo);

        if (!place_meeting(x + mx, y + my, O_parede))
        {
            x += mx;
            y += my;

            mov_x = mx;
            mov_y = my;
        }
        else if (!place_meeting(x + mx, y, O_parede))
        {
            x += mx;
            mov_x = mx;
        }
        else if (!place_meeting(x, y + my, O_parede))
        {
            y += my;
            mov_y = my;
        }
    }

    if (tempo_procurando <= 0)
    {
        estado = 0;
		som_hey_tocado = false;
    }
}

// =====================================================
// 5. ESCOLHER ANIMAÇÃO
// =====================================================

// MOVIMENTO HORIZONTAL
if (abs(mov_x) > 0.1 && abs(mov_x) >= abs(mov_y))
{
    sprite_index = sprite_lado;

    image_xscale = sign(mov_x);

    image_speed = 1;
}

// MOVIMENTO PARA BAIXO - FRENTE
else if (mov_y > 0.1)
{
    if (sprite_frente != noone)
    {
        sprite_index = sprite_frente;
        image_xscale = 1;
        image_speed = 1;
    }
}

// MOVIMENTO PARA CIMA - COSTAS
else if (mov_y < -0.1)
{
    sprite_index = sprite_costas;

    image_xscale = 1;

    image_speed = 1;
}

// PARADO
else
{
    image_speed = 0;
    image_index = 0;
}


// =====================================================
// GUARDA - MOVIMENTAÇÃO E ANIMAÇÃO
// =====================================================

// VARIÁVEIS DE MOVIMENTO
var mov_x = 0;
var mov_y = 0;

// =====================================================
// 1. PATRULHA
// =====================================================

if (estado == 0)
{
    var mov_patrol = vel * direcao;

    if (!place_meeting(x + mov_patrol, y, O_parede))
    {
        x += mov_patrol;
        mov_x = mov_patrol;
    }
    else
    {
        direcao *= -1;
    }
}

// =====================================================
// 2. DETECÇÃO DO JOGADOR
// =====================================================
if (estado == 0 && instance_exists(O_pai))
{
    var distancia = point_distance(x, y, O_pai.x, O_pai.y);

    if (distancia <= distancia_visao)
    {
        var dir_jogador = point_direction(x, y, O_pai.x, O_pai.y);

        if (abs(angle_difference(direcao * 180, dir_jogador)) <= 45)
        {
            estado = 1;

            if (!som_hey_tocado)
            {
                audio_play_sound(Som_hey, 1, false);
                som_hey_tocado = true;
            }
        }
    }
}

// =====================================================
// 3. PERSEGUIÇÃO
// =====================================================

if (estado == 1)
{
    if (instance_exists(O_pai))
    {
        var distancia = point_distance(x, y, O_pai.x, O_pai.y);

        var dir_jogador = point_direction(x, y, O_pai.x, O_pai.y);

        if (distancia > distancia_visao)
        {
            ultimo_x = O_pai.x;
            ultimo_y = O_pai.y;

            tempo_procurando = tempo_max_procurando;
            estado = 2;
        }
        else
        {
            var velocidade_perseguicao = vel * 1.5;

            var mx = lengthdir_x(velocidade_perseguicao, dir_jogador);
            var my = lengthdir_y(velocidade_perseguicao, dir_jogador);

            if (!place_meeting(x + mx, y + my, O_parede))
            {
                x += mx;
                y += my;

                mov_x = mx;
                mov_y = my;
            }
            else if (!place_meeting(x + mx, y, O_parede))
            {
                x += mx;
                mov_x = mx;
            }
            else if (!place_meeting(x, y + my, O_parede))
            {
                y += my;
                mov_y = my;
            }
            else
            {
                var tentativa = 3;

                if (!place_meeting(x + tentativa, y, O_parede))
                {
                    x += tentativa;
                    mov_x = tentativa;
                }
                else if (!place_meeting(x - tentativa, y, O_parede))
                {
                    x -= tentativa;
                    mov_x = -tentativa;
                }
                else if (!place_meeting(x, y + tentativa, O_parede))
                {
                    y += tentativa;
                    mov_y = tentativa;
                }
                else if (!place_meeting(x, y - tentativa, O_parede))
                {
                    y -= tentativa;
                    mov_y = -tentativa;
                }
            }
        }
    }
}

// =====================================================
// 4. PROCURANDO O JOGADOR
// =====================================================

if (estado == 2)
{
    tempo_procurando--;

    var distancia_ultimo = point_distance(
        x, y,
        ultimo_x, ultimo_y
    );

    if (distancia_ultimo > 5)
    {
        var dir_ultimo = point_direction(
            x, y,
            ultimo_x, ultimo_y
        );

        var mx = lengthdir_x(vel, dir_ultimo);
        var my = lengthdir_y(vel, dir_ultimo);

        if (!place_meeting(x + mx, y + my, O_parede))
        {
            x += mx;
            y += my;

            mov_x = mx;
            mov_y = my;
        }
        else if (!place_meeting(x + mx, y, O_parede))
        {
            x += mx;
            mov_x = mx;
        }
        else if (!place_meeting(x, y + my, O_parede))
        {
            y += my;
            mov_y = my;
        }
    }

    if (tempo_procurando <= 0)
    {
        estado = 0;
    }
}

// =====================================================
// 5. ESCOLHER ANIMAÇÃO
// =====================================================

// MOVIMENTO HORIZONTAL
if (abs(mov_x) > 0.1 && abs(mov_x) >= abs(mov_y))
{
    sprite_index = sprite_lado;

    image_xscale = sign(mov_x);

    image_speed = 1;
}

// MOVIMENTO PARA BAIXO - FRENTE
else if (mov_y > 0.1)
{
    if (sprite_frente != noone)
    {
        sprite_index = sprite_frente;
        image_xscale = 1;
        image_speed = 1;
    }
}

// MOVIMENTO PARA CIMA - COSTAS
else if (mov_y < -0.1)
{
    sprite_index = sprite_costas;

    image_xscale = 1;

    image_speed = 1;
}

// PARADO
else
{
    image_speed = 0;
    image_index = 0;
}
