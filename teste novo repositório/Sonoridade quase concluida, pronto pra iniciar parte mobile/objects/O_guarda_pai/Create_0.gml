

// ESTADO
estado = 0;

// VELOCIDADE
vel = 1;

// DIREÇÃO
direcao = 3;

// DISTÂNCIA DA PATRULHA
distancia_patrulha = 100;

// POSIÇÃO INICIAL
x_inicial = x;
y_inicial = y;

// VISÃO
distancia_visao = 400;
// ==============================
// SISTEMA DE DESPISTE
// ==============================

tempo_procurando = 2;
tempo_max_procurando = room_speed * 3;

ultimo_x = x;
ultimo_y = y;

estado = 0;

// 0 = patrulhando
// 1 = perseguindo
// 2 = procurando


etnia = irandom(2);

switch (etnia)
{
  case 0:
    sprite_index = S_soldado2;
    sprite_lado = S_soldado2;
    sprite_frente = S_soldado2_walk_front;
    break;

case 1:
    sprite_index = S_soldado3;
    sprite_lado = S_soldado3;
    sprite_frente = S_soldado3_walk_front;
    break;

case 2:
    sprite_index = S_soldado7;
    sprite_lado = S_soldado7;
    sprite_frente = S_soldado7_walk_front;
    break;
}
// ANIMAÇÃO
sprite_lado = sprite_index;
sprite_frente = noone;
sprite_costas = S_soldados_back;

// DIREÇÃO DA ANIMAÇÃO
image_speed = 1;
image_xscale = 1;

ultima_direcao = 0;

som_hey_tocado = false;
