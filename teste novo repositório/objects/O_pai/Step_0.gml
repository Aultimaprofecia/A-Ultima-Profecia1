
var hud_piscar = instance_find(O_vidas, 0);

// Se morreu, para de piscar e interrompe o movimento
if (morto)
{
    image_alpha = 1;
    exit;
}

// ==========================================
// PISCAR DURANTE A INVULNERABILIDADE
// ==========================================

if (instance_exists(hud_piscar) && hud_piscar.invulneravel)
{
    // Alterna entre visível e invisível
    if ((current_time div 100) mod 2 == 0)
    {
        image_alpha = 1;
    }
    else
    {
        image_alpha = 0;
    }
}
else
{
    // Aparência normal quando não estiver invulnerável
    image_alpha = 1;
}


// ==========================================
// PEGAR INPUT
// ==========================================

var mov_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var mov_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
// ==========================================
// ATIVAR DASH
// ==========================================

if (dash_tempo <= 0 && dash_cargas > 0)
{
    // DASH PARA DIREITA
    if (keyboard_check_pressed(vk_right))
    {
        dash_x = 1;
        dash_y = 0;
        dash_tempo = dash_duracao;
    }

    // DASH PARA ESQUERDA
    else if (keyboard_check_pressed(vk_left))
    {
        dash_x = -1;
        dash_y = 0;
        dash_tempo = dash_duracao;
    }

    // DASH PARA BAIXO
    else if (keyboard_check_pressed(vk_down))
    {
        dash_x = 0;
        dash_y = 1;
        dash_tempo = dash_duracao;
    }

    // DASH PARA CIMA
    else if (keyboard_check_pressed(vk_up))
    {
        dash_x = 0;
        dash_y = -1;
        dash_tempo = dash_duracao;
    }
}
// ==========================================
// GASTAR CARGA
// ==========================================

if (dash_tempo == dash_duracao)
{
    dash_cargas--;
}
// ==========================================
// RECARGA DO DASH
// ==========================================

if (dash_cargas < dash_cargas_max)
{
    dash_recarga++;

    if (dash_recarga >= dash_tempo_recarga)
    {
        dash_cargas++;
        dash_recarga = 0;
    }
}
else
{
    dash_recarga = 0;
}
// ==========================================
// NORMALIZAR DIAGONAL
// ==========================================

if (mov_x != 0 || mov_y != 0)
{
    var comprimento = point_distance(0, 0, mov_x, mov_y);

    mov_x /= comprimento;
    mov_y /= comprimento;
}


// ==========================================
// ESCOLHER SPRITE DE MOVIMENTO
// ==========================================

if (mov_x != 0 || mov_y != 0)
{
    // --------------------------------------
    // MOVIMENTO HORIZONTAL
    // --------------------------------------

    if (abs(mov_x) > abs(mov_y))
    {
        sprite_index = sprite_walk_side;

        if (mov_x > 0)
        {
            image_xscale = 1;
        }
        else
        {
            image_xscale = -1;
        }
    }


    // --------------------------------------
    // MOVIMENTO VERTICAL
    // --------------------------------------

    else
    {
        image_xscale = 1;

        if (mov_y > 0)
        {
            // PARA BAIXO
            sprite_index = sprite_walk_front;
        }
        else
        {
            // PARA CIMA
            sprite_index = sprite_walk_back;
        }
    }

    // Velocidade da animação
    image_speed = 0.5;
}


// ==========================================
// QUANDO ESTÁ PARADO
// ==========================================

else
{
    image_speed = 0;

    // Descobre qual idle usar
    if (sprite_index == sprite_walk_side)
    {
        sprite_index = sprite_idle_side;
    }
    else if (sprite_index == sprite_walk_front)
    {
        sprite_index = sprite_idle_front;
    }
    else if (sprite_index == sprite_walk_back)
    {
        sprite_index = sprite_idle_back;
    }
}

// ==========================================
// MOVIMENTO DO DASH
// ==========================================

if (dash_tempo > 0)
{
    dash_tempo--;

    // Horizontal
    if (dash_x != 0)
    {
        if (!place_meeting(x + dash_x * dash_vel, y, O_parede))
        {
            x += dash_x * dash_vel;
        }
    }

    // Vertical
    if (dash_y != 0)
    {
        if (!place_meeting(x, y + dash_y * dash_vel, O_parede))
        {
            y += dash_y * dash_vel;
        }
    }
}if (dash_tempo <= 0)
{
    // ==========================================
    // COLISÃO HORIZONTAL
    // ==========================================

    if (!place_meeting(x + mov_x * vel, y, O_parede))
    {
        x += mov_x * vel;
    }


    // ==========================================
    // COLISÃO VERTICAL
    // ==========================================

    if (!place_meeting(x, y + mov_y * vel, O_parede))
    {
        y += mov_y * vel;
    }
}

image_speed = 1;
// ==========================================
// INVULNERABILIDADE APÓS DANO
// ==========================================

if (invulneravel && !morto)
{
    tempo_invulneravel--;
    tempo_piscada++;

    // Piscar a cada 6 frames
    if (tempo_piscada >= 6)
    {
        visivel_dano = !visivel_dano;
        tempo_piscada = 0;
    }

    // Terminou a imunidade
    if (tempo_invulneravel <= 0)
    {
        invulneravel = false;
        visivel_dano = true;
        tempo_piscada = 0;
    }
}

