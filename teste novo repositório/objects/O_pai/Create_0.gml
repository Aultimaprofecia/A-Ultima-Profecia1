// ==========================================
// VERIFICAR PERSONAGEM
// ==========================================

if (!variable_global_exists("personagem"))
{
    global.personagem = 0;
}


// ==========================================
// VELOCIDADE
// ==========================================

vel = 4;


// ==========================================
// SPRITES
// ==========================================

sprite_idle_side  = -1;
sprite_walk_side  = -1;

sprite_idle_front = -1;
sprite_walk_front = -1;

sprite_idle_back  = -1;
sprite_walk_back  = -1;


// ==========================================
// ESCOLHER SPRITES DO PERSONAGEM
// ==========================================

switch (global.personagem)
{
    // ======================================
    // THARLIANY
    // ======================================

    case 0:

        sprite_idle_side  = S_tharliany_side_idle;
        sprite_walk_side  = S_tharliany_side_walk;

        sprite_idle_front = S_tharliany_front_idle;
        sprite_walk_front = S_tharliany_front_walk;

        sprite_idle_back  = S_tharliany_back_idle;
        sprite_walk_back  = S_tharliany_back_walk;

    break;


    // ======================================
    // SOLARION
    // ======================================

    case 1:

        sprite_idle_side  = S_solarion_side_idle;
        sprite_walk_side  = S_solarion_side_walk;

        sprite_idle_front = S_solarion_front_idle;
        sprite_walk_front = S_solarion_front_walk;

        sprite_idle_back  = S_solarion_back_idle;
        sprite_walk_back  = S_solarion_back_walk;

    break;


    // ======================================
    // LUARCA
    // ======================================

    case 2:

        sprite_idle_side  = S_luarca_side_idle;
        sprite_walk_side  = S_luarca_side_walk;

        sprite_idle_front = S_luarca_front_idle;
        sprite_walk_front = S_luarca_front_walk;

        sprite_idle_back  = S_luarca_back_idle;
        sprite_walk_back  = S_luarca_back_walk;

    break;
}


// ==========================================
// SPRITE INICIAL
// ==========================================

sprite_index = sprite_idle_front;

image_speed = 1;

image_xscale = 1;
direcao = "front";
// ==========================================
// DASH
// ==========================================

dash_vel = 15;
dash_tempo = 0;
dash_duracao = 6;

dash_x = 0;
dash_y = 0;
// ==========================================
// CARGAS DO DASH
// ==========================================

dash_cargas = 3;
dash_cargas_max = 3;

dash_recarga = 0;
dash_tempo_recarga = room_speed * 2;

if (!variable_global_exists("historico_rooms"))
{
    global.historico_rooms = [];
}

if (!variable_global_exists("pergaminhos"))
{
    global.pergaminhos = 0;
}

if (!variable_global_exists("pergaminhos_coletados"))
{
    global.pergaminhos_coletados = [];
}
// ==========================================
// SISTEMA DE VIDA E MORTE
// ==========================================

if (!variable_global_exists("vidas"))
{
    global.vidas = 3;
}

invulneravel = false;
tempo_invulneravel = 0;

tempo_piscada = 0;
visivel_dano = true;

morto = false;

// Guardar o ponto inicial da room
x_inicial = x;
y_inicial = y;